//
//  CategoryDetailsView.swift
//  TravelDiscovery
//
//  Created by Karakhanyan Tigran on 24.04.2022.
//

import SwiftUI

class CategoryDetailsViewModel: ObservableObject {
    
    @Published var isLoading = true
    @Published var places: [Place] = []
    
    init() {
        
        guard let url = URL(string: "https://travel.letsbuildthatapp.com/travel_discovery/category?name=art") else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let data = data {
                do {
                    self.places = try JSONDecoder().decode([Place].self, from: data)
                } catch {
                    print(error)
                }
            }
            
            self.isLoading = false
            
        }.resume()
    }
}

struct CategoryDetailsView: View {
    
    @ObservedObject var vm = CategoryDetailsViewModel()
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                if vm.isLoading {
                    VStack {
                        ActivityIndicatorView()
                        Text("Currently Loading")
                    }
                    .position(x: geometry.frame(in: .global).midX, y: geometry.frame(in: .global).midY)
                } else {
                    ScrollView {
                        ForEach(vm.places, id: \.id) { place in
                            VStack(alignment: .leading, spacing: 0) {
                                Image("artItaly")
                                    .resizable()
                                    .frame(height: 300)
                                Text(place.name)
                                    .font(.system(size: 12, weight: .semibold))
                                    .padding()
                                
                            }   .asTile()
                                .padding()
                                .frame(width: geometry.size.width)
                        }
                    }
                }
            }
        } .navigationBarTitle("Category", displayMode: .inline)
    }
}

struct CategoryDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryDetailsView()
    }
}
