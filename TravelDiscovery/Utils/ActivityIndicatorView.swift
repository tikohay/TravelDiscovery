//
//  ActivityIndicatorView.swift
//  TravelDiscovery
//
//  Created by Karakhanyan Tigran on 26.04.2022.
//

import SwiftUI

struct ActivityIndicatorView: UIViewRepresentable {
    
    @State var isAnimating: Bool = true
    
    func makeUIView(context: Context) -> UIActivityIndicatorView {
        let aiv = UIActivityIndicatorView(style: .large)
        aiv.startAnimating()
        return aiv
    }
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) { }
}
