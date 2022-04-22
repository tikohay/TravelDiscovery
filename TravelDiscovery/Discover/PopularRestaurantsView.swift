//
//  PopularRestaurantsView.swift
//  TravelDiscovery
//
//  Created by Karakhanyan Tigran on 22.04.2022.
//

import SwiftUI

struct PopularRestaurantsView: View {
    
    var restaurants: [Restaurant] = [
        .init(name: "Japan's Finest Tapas", imageName: "sushi"),
        .init(name: "Bar & Grill", imageName: "restaurant")
    ]
    
    var body: some View {
        VStack {
            HStack {
                Text("Pupular places to eat")
                    .font(.system(size: 14, weight: .semibold))
                Spacer()
                Text("See all")
                    .font(.system(size: 12, weight: .semibold))
            } .padding([.horizontal, .top])
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 8.0) {
                    ForEach(restaurants, id: \.id) { restaurant in
                        HStack(spacing: 8) {
                            Image(restaurant.imageName)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 60, height: 60)
                                .cornerRadius(5)
                                .clipped()
                                .padding(.leading, 6)
                                .padding(.vertical, 6)
                            
                            VStack(alignment: .leading, spacing: 6) {
                                HStack {
                                    Text(restaurant.name)
                                    Spacer()
                                    Button {
                                        print("hello")
                                    } label: {
                                        Image(systemName: "ellipsis")
                                            .foregroundColor(.gray)
                                    }
                                }
                                
                                HStack {
                                    Image(systemName: "star.fill")
                                    Text("4.7 Sushi $$")
                                }
                                
                                Text("Tokyo, Japan")
                            }
                            .font(.system(size: 12, weight: .semibold))
                            
                            Spacer()
                        }
                        .frame(width: 240)
                        .asTile()
                        .padding(.bottom)
                    }
                } .padding(.horizontal)
            }
        }
    }
}
