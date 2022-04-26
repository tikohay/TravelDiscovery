//
//  Place.swift
//  TravelDiscovery
//
//  Created by Karakhanyan Tigran on 26.04.2022.
//

import Foundation

struct Place: Decodable, Identifiable {
    let id = UUID()
    let name, thumbnail: String
}
