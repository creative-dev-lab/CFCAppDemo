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

struct SearchResult: Codable, Hashable {
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

extension SearchResult {
    static let example = SearchResult(
        airportID: "3fd14d47-d375-4768-a0eb-cff970e23e35",
        iataCode: "DPA",
        airportName: "Dupage Airport",
        country: "United States",
        municipality: "West Chicago"
    )
}
