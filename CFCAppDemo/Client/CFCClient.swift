//
//  CFCClient.swift
//  CFCAppDemo
//
//  Created by King on 2/17/23.
//

import Foundation
import UIKit
import Combine

// Since I believe apiKey needs to be out of version control
// I removed apiKey from here,
// instead better to load it by using cocoapods-key plugin or arkana
final class CFCClient: NetworkClient {

    let session: URLSession
    let additionalRequestBodyParams: [String: String]

    /// CFCClient Initialization
    /// - Parameters:
    ///   - configuration: URLSessionConfiguration here - most likely to add the app & system information to the URLRequest header
    ///   - additionalRequestBodyParams: In case we need to have something like Device ID, App version or etc.
    init(configuration: URLSessionConfiguration? = nil,
             additionalRequestBodyParams: [String: String] = [:]) {
        let sessionConfig = configuration ?? URLSessionConfiguration.default

        let appVersion: String = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? ""
        let buildNumber: String = Bundle.main.infoDictionary?["CFBundleVersion"] as? String ?? ""
        let bundleId = Bundle.main.bundleIdentifier ?? ""
        let systemVersion = UIDevice.current.systemVersion
        let userAgentHeaderValue = "CFCAppDemo/\(appVersion) (\(bundleId); build:\(buildNumber); iOS \(systemVersion)) URLSession"
        sessionConfig.httpAdditionalHeaders = ["User-Agent": userAgentHeaderValue]

        self.session = URLSession(configuration: sessionConfig)
        self.additionalRequestBodyParams = additionalRequestBodyParams
    }

    func search(text: String) -> AnyPublisher<SearchResults, Error> {
        var endpoint = NetworkEndpoint.search(text: text)
        endpoint.requestBody = endpoint.requestBody.merging(additionalRequestBodyParams) { (current, _) in current }
        #if DEBUG
        dump(endpoint.asURLRequest())
        #endif
        return execute(endpoint.asURLRequest(), decodingType: SearchResults.self)
    }

    func getOffset(originID: String, destID: String) -> AnyPublisher<OffsetResult, Error> {
        var endpoint = NetworkEndpoint.getOffset(originID: originID, destID: destID)
        endpoint.requestBody = endpoint.requestBody.merging(additionalRequestBodyParams) { (current, _) in current }
        #if DEBUG
        dump(endpoint.asURLRequest())
        #endif
        return execute(endpoint.asURLRequest(), decodingType: OffsetResult.self)
    }
}
