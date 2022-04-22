//
//  ContentView.swift
//  TravelDiscovery
//
//  Created by Karakhanyan Tigran on 20.04.2022.
//

import SwiftUI

struct DiscoverView: View {
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [
            .foregroundColor: UIColor.white
        ]
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 1, green: 0.7113083005, blue: 0, alpha: 1)), Color(#colorLiteral(red: 1, green: 0.3716355562, blue: 0, alpha: 1))]), startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                Color.discoverBackground
                    .offset(y: 400)
                ScrollView {
                    
                    HStack {
                        Image(systemName: "magnifyingglass")
                        Text("Where do you want to go?")
                        Spacer()
                    }
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundColor(.white)
                    .padding()
                    .background(Color(.init(white: 1, alpha: 0.3)))
                    .cornerRadius(10)
                    .padding(16)
                    
                    DiscoverCategoriesView()
                    
                    VStack {
                        PopularDestinationView()
                        PopularRestaurantsView()
                        TrendingCreatorsView()
                    } .background(Color.discoverBackground)
                        .cornerRadius(16)
                        .padding(.top, 32)
                }
            }
            .navigationTitle("Discover")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        DiscoverView()
            .previewDevice((PreviewDevice(rawValue: "iPhone 12 Pro Max")))
    }
}





