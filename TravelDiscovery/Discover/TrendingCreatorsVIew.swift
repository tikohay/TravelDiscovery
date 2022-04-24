//
//  TrendingCreatorsVIew.swift
//  TravelDiscovery
//
//  Created by Karakhanyan Tigran on 22.04.2022.
//

import SwiftUI

struct TrendingCreatorsView: View {
    
    var users: [User] = [
        .init(name: "Dwayne Johnson", imageName: "dwayne"),
        .init(name: "Jennifer Lawrens", imageName: "jennifer"),
        .init(name: "Jason Statham", imageName: "jason")
    ]
    
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
                HStack(alignment: .top, spacing: 12.0) {
                    ForEach(users, id: \.id) { user in
                        VStack {
                            Image(user.imageName)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 60, height: 60)
                                .cornerRadius(.infinity)
                                .shadow(color: .gray, radius: 5, x: 0, y: 2)
                            Text(user.name)
                                .font(.system(size: 11, weight: .semibold))
                                .multilineTextAlignment(.center)
                        }
                        .frame(width: 60)
                        .padding(.bottom)
                    }
                } .padding([.horizontal, .top])
            }
        }
    }
}
