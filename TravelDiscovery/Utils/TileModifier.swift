//
//  TileModifier.swift
//  TravelDiscovery
//
//  Created by Karakhanyan Tigran on 22.04.2022.
//

import SwiftUI

extension View {
    func asTile() -> some View {
        modifier(TileModifier())
    }
}

struct TileModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background(.white)
            .cornerRadius(5)
            .shadow(color: Color(UIColor.lightGray), radius: 2, x: 0, y: 1)
    }
}
