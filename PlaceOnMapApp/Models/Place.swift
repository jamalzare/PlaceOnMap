//
//  Place.swift
//  PlaceOnMapApp
//
//  Created by Jamal on 6/17/21.
//

import Foundation

struct Place: Decodable {
    let name: String
}


struct Place1: Decodable {
    
    let latitude: Double
    let longitude: Double
    let label: String
    let name: String
    let type: String
    let number:  String
    let street:  String
    let postal_code:  String
    let confidence: Int
    let region:  String
    let region_code: String
    let administrative_area: String?
    let neighbourhood: String
    let country: String
    let country_code: String
    let map_url: String
}
