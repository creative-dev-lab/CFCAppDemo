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
        return NetworkEndpoint(method: .GET, path: "/offset-estimation/airline-offsets/airports/",
                               queryItems: [
                                URLQueryItem(name: "search", value: text)
                               ]
        )
    }

    static func getOffset(originID: String, destID: String) -> NetworkEndpoint {
        return NetworkEndpoint(method: .POST, path: "/offset-estimation/airline-offsets/flights",
                                                     requestBody: [
                                                        "origin_airport_id": originID,
                                                        "destination_airport_id": destID
                                                     ]
        )
    }

}
