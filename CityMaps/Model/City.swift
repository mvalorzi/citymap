//
//  City.swift
//  CityMaps
//
//  Created by Martin Valorzi on 21/08/2024.
//

import Foundation

struct City: Decodable {
    var id: Int
    var name: String?
    var country: String?
    var coordinate: CityCoordinate
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case name = "name"
        case country = "country"
        case coordinate = "coord"
    }
}

struct CityCoordinate: Decodable {
    var latitude: Double?
    var longitude: Double?
    enum CodingKeys: String, CodingKey {
        case latitude = "lat"
        case longitude = "lon"
    }
}
