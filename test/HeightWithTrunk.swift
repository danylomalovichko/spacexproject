//
//  HeightWithTrunk.swift
//  test
//
//  Created by ovr on 19.05.2021.
//

import Foundation

class HeightWithTrunk: Codable {
    let meters: Double
    let feet: Double
    
    enum CodingKeys: String, CodingKey {
        case meters
        case feet
    }
}
