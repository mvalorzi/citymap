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
        Group {
            if viewModel.isLoading {
                ProgressView("loading".localized)
                    .progressViewStyle(CircularProgressViewStyle())
            } else {
                if viewModel.orientation.isLandscape {
                    HStack {
                        List(viewModel.filterList, id: \.id) { item in
                            Button(item.title) {
                                viewModel.changeCity(item: item)
                            }
                        }
                        .listStyle(.plain)
                        .searchable(text: $viewModel.clueText, placement: .navigationBarDrawer(displayMode: .always), prompt: "filter".localized)
                        MapView(viewModel: MapViewModel(city: viewModel.selectedCity))
                    }
                } else {
                    List(viewModel.filterList, id: \.id) { item in
                        NavigationLink(destination: MapView(viewModel: viewModel.selectCity(item: item))) {
                            Text(item.title)
                        }
                    }
                    .listStyle(.plain)
                    .searchable(text: $viewModel.clueText, placement: .navigationBarDrawer(displayMode: .always), prompt: "filter".localized)
                }
            }
        }
        .onRotate { newOrientation in
            viewModel.orientation = newOrientation
        }
    }
}

#Preview {
    CityView(viewModel: CityViewModel(orientation: .portrait))
}
