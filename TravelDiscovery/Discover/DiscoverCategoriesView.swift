//
//  DiscoverCategoriesView.swift
//  TravelDiscovery
//
//  Created by Karakhanyan Tigran on 22.04.2022.
//

import SwiftUI

struct DiscoverCategoriesView: View {
    
    let categories: [Category] = [
        .init(name: "Art", imageName: "paintpalette.fill"),
        .init(name: "Sport", imageName: "sportscourt.fill"),
        .init(name: "Live Events", imageName: "music.mic"),
        .init(name: "Food", imageName: "cart.fill"),
        .init(name: "History", imageName: "books.vertical.fill")
    ]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .top, spacing: 14) {
                ForEach(categories, id: \.id) { category in
                    NavigationLink {
                        CategoryDetailsView(title: category.name)
                    } label: {
                        VStack(spacing: 8) {
                            Image(systemName: category.imageName)
                                .font(.system(size: 20))
                                .foregroundColor(Color(#colorLiteral(red: 1, green: 0.5709188581, blue: 0, alpha: 1)))
                                .frame(width: 64, height: 64)
                                .background(.white)
                                .cornerRadius(.infinity)
                            Text(category.name)
                                .font(.system(size: 12, weight: .semibold))
                                .multilineTextAlignment(.center)
                                .foregroundColor(.white)
                        }
                        .frame(width: 68)
                    }
                }
            }   .padding(.horizontal)
                .padding(.top, 5)
        }
    }
}
