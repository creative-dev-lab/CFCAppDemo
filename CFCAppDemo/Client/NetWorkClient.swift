//
//  NetWorkClient.swift
//  CFCAppDemo
//
//  Created by King on 2/17/23.
//

import Foundation
import Combine

/// Not sure what would error model look like
/// But this could be one of the best demonstrations to handle this
struct NetworkClientErrorResponseModel: Codable {
    let message: String
    let code: Int

    enum CodingKeys: String, CodingKey {
        case message = "status_message"
        case code = "status_code"
    }
}

enum NetworkClientError: Error {
    case message(statusCode: Int, message: String)

    var localizedDescription: String {
        switch self {
        case .message(_, let message): return message
        }
    }
}

protocol NetworkClient {
    var session: URLSession { get }

    func execute<T>(_ request: URLRequest,
                                    decodingType: T.Type,
                                    decoder: JSONDecoder,
                                    queue: DispatchQueue,
                                    retries: Int) -> AnyPublisher<T, Error> where T: Decodable
}

extension NetworkClient {
    func execute<T>(_ request: URLRequest,
                                    decodingType: T.Type,
                                    decoder: JSONDecoder = JSONDecoder(),
                                    queue: DispatchQueue = .main,
                                    retries: Int = 0) -> AnyPublisher<T, Error> where T: Decodable {

        return session.dataTaskPublisher(for: request)
            .tryMap {
                guard let response = $0.response as? HTTPURLResponse else {
                    throw NSError(domain: "com.git.CFCAppDemo.networkclient",
                                                code: -1,
                                                userInfo: [NSLocalizedDescriptionKey: "Missing response"])
                }
                guard 200..<300 ~= response.statusCode else {
                    if let errorModel = try? JSONDecoder().decode(NetworkClientErrorResponseModel.self, from: $0.data) {
                        throw NetworkClientError.message(statusCode: errorModel.code, message: errorModel.message)
                    } else {
                        throw NSError(domain: "com.git.CFCAppDemo.networkclient",
                                                    code: response.statusCode,
                                                    userInfo: [NSLocalizedDescriptionKey: HTTPURLResponse.localizedString(forStatusCode: response.statusCode)])
                    }
                }
                return $0.data
            }
            .decode(type: T.self, decoder: decoder)
            .receive(on: queue)
            .retry(retries)
            .eraseToAnyPublisher()
    }
}
