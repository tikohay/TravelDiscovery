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
    @Published var errorMessage = ""
    
    init(name: String) {
        
        guard let url = URL(string: "https://travel.letsbuildthatapp.com/travel_discovery/category?name=\(name.lowercased())") else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let statusCode = (response as? HTTPURLResponse)?.statusCode, statusCode >= 400 {
                self.isLoading = false
                self.errorMessage = "Bad status: \(statusCode)"
                return
            }
            
            if let data = data {
                do {
                    self.places = try JSONDecoder().decode([Place].self, from: data)
                } catch {
                    print(error)
                    self.errorMessage = error.localizedDescription
                }
            }
            
            self.isLoading = false
            
        }.resume()
    }
}

struct CategoryDetailsView: View {
    
    let name: String
    @ObservedObject var vm: CategoryDetailsViewModel
    
    init(name: String) {
        self.name = name
        self.vm = .init(name: name)
    }
    
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
                    ZStack {
                        if !vm.errorMessage.isEmpty {
                            VStack {
                                Image(systemName: "xmark.octagon.fill")
                                    .font(.system(size: 64, weight: .semibold))
                                    .foregroundColor(.red)
                                Text(vm.errorMessage)
                            }.position(x: geometry.frame(in: .global).midX, y: geometry.frame(in: .global).midY)
                                
                        }
                        ScrollView {
                            ForEach(vm.places, id: \.id) { place in
                                VStack(alignment: .leading, spacing: 0) {
                                    Image("artItaly")
                                        .resizable()
                                        .frame(height: 300)
                                    Text(place.name)
                                        .font(.system(size: 14, weight: .semibold))
                                        .padding()
                                    
                                }   .asTile()
                                    .padding()
                                    .frame(width: geometry.size.width)
                            }
                        }
                    }
                }
            }
        } .navigationBarTitle(name, displayMode: .inline)
    }
}

struct CategoryDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CategoryDetailsView(name: "Food")
        }
    }
}
