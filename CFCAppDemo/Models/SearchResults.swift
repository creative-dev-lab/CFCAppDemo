//
//  SearchResults.swift
//  CFCAppDemo
//
//  Created by King on 2/17/23.
//

import Foundation

struct SearchResults: Codable {
    let count: Int
    let results: [SearchResult]
}

struct SearchResult: Codable {
    let airportID: String
    let iataCode: String
    let airportName: String
    let country: String
    let municipality: String

    enum CodingKeys: String, CodingKey {
        case airportID = "airport_id"
        case iataCode = "iata_code"
        case airportName = "airport_name"
        case country, municipality
    }
}
