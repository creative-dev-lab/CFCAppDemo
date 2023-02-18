//
//  OffsetResult.swift
//  CFCAppDemo
//
//  Created by King on 2/17/23.
//

import Foundation

struct OffsetResult: Codable {
    let id: String
    let orgAirport: String
    let destAirport: String
    let footprint: Float

    enum CodingKeys: String, CodingKey {
        case id = "flight_instance_id"
        case orgAirport = "origin_airport"
        case destAirport = "destination_airport"
        case footprint = "kg_co2_footprint"
    }
}

extension OffsetResult {
    static let example = OffsetResult(
        id: "1",
        orgAirport: "New York (JFK)",
        destAirport: "Paris (CDG)",
        footprint: 10
    )
}
