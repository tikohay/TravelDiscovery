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

struct Destination: Identifiable {
    var id = UUID()
    let name, country, imageName: String
}

struct Restaurant: Identifiable {
    var id = UUID()
    let name, imageName: String
}

struct User: Identifiable {
    var id = UUID()
    let name, imageName: String
}

struct ContentView: View {
    
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
                Color(.init(white: 0.95, alpha: 1))
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
                    } .background(Color(.init(white: 0.95, alpha: 1)))
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
        ContentView()
            .previewDevice((PreviewDevice(rawValue: "iPhone 12 Pro Max")))
    }
}

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
            }   .padding(.horizontal)
                .padding(.top, 5)
        }
    }
}

struct PopularDestinationView: View {
    
    var destinations: [Destination] = [
        .init(name: "Paris", country: "France", imageName: "paris"),
        .init(name: "Tokyo", country: "Japan", imageName: "japan"),
        .init(name: "New York", country: "USA", imageName: "newyork")
    ]
    
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
                    ForEach(destinations, id: \.id) { destination in
                        VStack(alignment: .leading, spacing: 0) {
                            
                            Image(destination.imageName)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 125, height: 125)
                            
                                .cornerRadius(4)
                                .padding(.horizontal, 6)
                                .padding(.vertical, 6)
                            
                            Text(destination.name)
                                .font(.system(size: 12, weight: .semibold))
                                .padding(.horizontal, 12)
                            Text(destination.country)
                                .font(.system(size: 12, weight: .semibold))
                                .padding(.horizontal, 12)
                                .padding(.bottom, 8)
                                .foregroundColor(.gray)
                        }
                        .background(.white)
                        .cornerRadius(5)
                        .shadow(color: Color(UIColor.lightGray), radius: 2, x: 0, y: 1)
                        .padding(.bottom)
                    }
                } .padding(.horizontal)
            }
        }
    }
}

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
                        .background(.white)
                        .cornerRadius(5)
                        .shadow(color: Color(UIColor.lightGray), radius: 2, x: 0, y: 1)
                        .padding(.bottom)
                    }
                } .padding(.horizontal)
            }
        }
    }
}

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
                            Text(user.name)
                                .font(.system(size: 11, weight: .semibold))
                                .multilineTextAlignment(.center)
                        }
                        .frame(width: 60)
                        .shadow(color: .gray, radius: 5, x: 0, y: 2)
                        .padding(.bottom)
                    }
                } .padding([.horizontal, .top])
            }
        }
    }
}



