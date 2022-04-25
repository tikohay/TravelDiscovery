//
//  CategoryDetailsView.swift
//  TravelDiscovery
//
//  Created by Karakhanyan Tigran on 24.04.2022.
//

import SwiftUI

class CategoryDetailsViewModel: ObservableObject {
    
    @Published var isLoading = true
    @Published var places: [Int] = []
    
    init() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.isLoading = false
            self.places = Array(0..<10)
        }
    }
}

struct ActivityIndicatorView: UIViewRepresentable {
    
    @State var isAnimating: Bool = true
    
    func makeUIView(context: Context) -> UIActivityIndicatorView {
        let aiv = UIActivityIndicatorView(style: .large)
        aiv.startAnimating()
        return aiv
    }
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {
        
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
                        ForEach(vm.places, id: \.self) { num in
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
