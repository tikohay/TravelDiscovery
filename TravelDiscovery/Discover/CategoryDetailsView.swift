//
//  CategoryDetailsView.swift
//  TravelDiscovery
//
//  Created by Karakhanyan Tigran on 24.04.2022.
//

import SwiftUI

struct CategoryDetailsView: View {
    
    var title: String = ""
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                ForEach(0...5, id: \.self) { num in
                    VStack(alignment: .leading, spacing: 0) {
                        Image("artItaly")
                            .resizable()
                            .frame(height: 300)
                        Text(String("hello"))
                            .font(.system(size: 12, weight: .semibold))
                            .padding()
                        
                    }   .asTile()
                        .padding()
                        .frame(width: geometry.size.width)
                }
            }
        } .navigationBarTitle("Category", displayMode: .inline)
    }
}
