//
//  ContentView.swift
//  TravelDiscovery
//
//  Created by Karakhanyan Tigran on 20.04.2022.
//

import SwiftUI

struct Category: Identifiable {
    var id = UUID()
    let name, imageName: String
}

struct ContentView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                DiscoverCategoriesView()
                PopularDestinationView()
                PopularRestaurantsView()
                TrendingCreatorsView()
            } .navigationTitle("Discover")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice((PreviewDevice(rawValue: "iPhone 12 Pro Max")))
    }
}

struct DiscoverCategoriesView: View {
    
    let categories: [Category] = [
        .init(name: "Art", imageName: "paintpalette.fill"),
        .init(name: "Sport", imageName: "sportscourt.fill"),
        .init(name: "Live Events", imageName: "music.mic"),
        .init(name: "Food", imageName: "music.mic"),
        .init(name: "History", imageName: "music.mic")
    ]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .top, spacing: 14) {
                ForEach(categories, id: \.id) { category in
                    VStack(spacing: 8) {
                        Image(systemName: category.imageName)
                            .font(.system(size: 20))
                            .foregroundColor(.white)
                            .frame(width: 64, height: 64)
                            .background(.gray)
                            .cornerRadius(.infinity)
                            .shadow(color: .gray, radius: 5, x: 0, y: 2)
                        Text(category.name)
                            .font(.system(size: 12, weight: .semibold))
                            .multilineTextAlignment(.center)
                    }
                    .frame(width: 68)
                }
            }   .padding(.horizontal)
                .padding(.top, 5)
        }
    }
}

struct PopularDestinationView: View {
    var body: some View {
        VStack {
            HStack {
                Text("Pupular destinations")
                    .font(.system(size: 14, weight: .semibold))
                Spacer()
                Text("See all")
                    .font(.system(size: 12, weight: .semibold))
            } .padding([.horizontal, .top])
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 8.0) {
                    ForEach(0..<5, id: \.self) { num in
                        Spacer()
                            .frame(width: 125, height: 150)
                            .background(.gray)
                            .cornerRadius(5)
                            .shadow(color: .gray, radius: 4, x: 0, y: 2)
                            .padding(.bottom)
                    }
                } .padding(.horizontal)
            }
        }
    }
}

struct PopularRestaurantsView: View {
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
                    ForEach(0..<5, id: \.self) { num in
                        Spacer()
                            .frame(width: 200, height: 64)
                            .background(.gray)
                            .cornerRadius(5)
                            .shadow(color: .gray, radius: 4, x: 0, y: 2)
                            .padding(.bottom)
                    }
                } .padding(.horizontal)
            }
        }
    }
}

struct TrendingCreatorsView: View {
    var body: some View {
        VStack {
            HStack {
                Text("Trending creators")
                    .font(.system(size: 14, weight: .semibold))
                Spacer()
                Text("See all")
                    .font(.system(size: 12, weight: .semibold))
            } .padding([.horizontal, .top])
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 8.0) {
                    ForEach(0..<5, id: \.self) { num in
                        Spacer()
                            .frame(width: 50, height: 50)
                            .background(.yellow)
                            .cornerRadius(.infinity)
                            .shadow(color: .gray, radius: 5, x: 0, y: 2)
                            .padding(.bottom)
                    }
                } .padding([.horizontal, .top])
            }
        }
    }
}



