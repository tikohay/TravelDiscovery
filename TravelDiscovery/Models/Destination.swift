//
//  Destination.swift
//  TravelDiscovery
//
//  Created by Karakhanyan Tigran on 22.04.2022.
//

import Foundation

struct Destination: Identifiable {
    var id = UUID()
    let name, country, imageName: String
}
