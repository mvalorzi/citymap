// 
//  MapView.swift
//  CityMaps
//
//  Created by Martin Valorzi on 21/08/2024.
//

import SwiftUI
struct CityView: View {
    @ObservedObject var viewModel: CityViewModel
    var body: some View {
        GeometryReader { geometry in
            if viewModel.isLoading {
                ProgressView("Loading...")
                    .progressViewStyle(CircularProgressViewStyle())
            } else {
                VStack {
                    NavigationView {
                            List(viewModel.filterList) { item in
                                HStack {
                                    Text(item.title)
                                        .foregroundColor(.black)
                                }
                                .onTapGesture {
                                }
                            }
                            .listStyle(PlainListStyle())
                        }
                }
            }
        }
        .padding()
    }
}

#Preview {
    CityView(viewModel: CityViewModel())
}
