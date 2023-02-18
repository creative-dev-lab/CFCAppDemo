//
//  NetworkEndpoint.swift
//  CFCAppDemo
//
//  Created by King on 2/17/23.
//

import Foundation

// Looks like we need only GET and POST within this project.
// In case we need other request methods,
// just simply uncomment the one you want below.
enum RequestMethod: String {
    case GET
    case POST
//    case HEAD
//    case PUT
//    case DELETE
//    case PATCH
}

struct NetworkEndpoint {
    let method: RequestMethod
    let path: String
    var queryItems: [URLQueryItem]
    var requestBody: [String: Any]
    var customHeaders: [String: String]
    var scheme: String
    var host: String
    var timeout: TimeInterval

    init(
        method: RequestMethod = .GET,
        path: String,
        queryItems: [URLQueryItem] = [],
        requestBody: [String: Any] = [:],
        customHeaders: [String: String] = [:],
        scheme: String = "https",
        host: String = cfcBaseUrl,
        timeout: TimeInterval = 60
    ) {
        self.method = method
        self.path = path
        self.queryItems = queryItems
        self.requestBody = requestBody
        self.customHeaders = customHeaders
        self.scheme = scheme
        self.host = host
        self.timeout = timeout
    }
}

extension NetworkEndpoint {
    func asURLRequest() -> URLRequest {
        var components = URLComponents()
        components.scheme = scheme
        components.host = host
        components.path = path
        if !queryItems.isEmpty {
            components.queryItems = queryItems
        }
        guard let url = components.url else {
            preconditionFailure("URL could not be created from components: \(components)")
        }

        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue

        let authenticationToken = "Api-Key " + Env().API_KEY
        request.setValue(authenticationToken, forHTTPHeaderField: "Authorization")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type") // optional: but this might be necessary as usual.

        customHeaders.forEach {
            request.setValue($0.value, forHTTPHeaderField: $0.key)
        }

        if !requestBody.isEmpty, let bodyData = try? JSONSerialization.data(withJSONObject: requestBody, options: []) {
            request.httpBody = bodyData
            #if DEBUG
            let str = String(decoding: bodyData, as: UTF8.self)
            print(str)
            #endif
        }
        request.timeoutInterval = timeout
        return request
    }
}
