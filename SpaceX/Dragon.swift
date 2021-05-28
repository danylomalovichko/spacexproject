//
//  Dragon.swift
//  SpaceX
//
//  Created by ovr on 19.05.2021.
//

import Foundation

struct DragonsResponse: Codable {
    var dragons: [Dragon]
}
struct Dragon: Codable {
    let name: String
    let type: String
    let images: [URL]
    let wikipedia: URL
    let description: String
    let dryMassKg: Int
    let firstFlight: String
    let heightWithTrunk: HeightWithTrunk
    
    enum CodingKeys: String, CodingKey {
        case images = "flickr_images"
        case name
        case type
        case description
        case wikipedia
        case dryMassKg = "dry_mass_kg"
        case firstFlight = "first_flight"
        case heightWithTrunk = "height_w_trunk"
    }
}
