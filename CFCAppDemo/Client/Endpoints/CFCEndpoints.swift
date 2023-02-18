//
//  CFCEndpoints.swift
//  CFCAppDemo
//
//  Created by King on 2/17/23.
//

import Foundation
import UIKit

// Just an extension of the NetworkEndpoint
extension NetworkEndpoint {

    static func search(text: String) -> NetworkEndpoint {
        return NetworkEndpoint(method: .GET, path: "/offset-estimation/airline-offsets/airports?search=\(text)")
    }

    static func getOffset(originID: String, destID: String) -> NetworkEndpoint {
        return NetworkEndpoint(method: .POST, path: "/offset-estimation/airline-offsets/flights",
                                                     queryItems: [
                                                        URLQueryItem(name: "origin_airport_id", value: originID),
                                                        URLQueryItem(name: "destination_airport_id", value: destID)
                                                     ]
        )
    }

}
