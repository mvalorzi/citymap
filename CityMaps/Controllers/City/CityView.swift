//
//  MapView.swift
//  CityMaps
//
//  Created by Martin Valorzi on 21/08/2024.
//

import SwiftUI
struct CityView: View {
    @ObservedObject var viewModel: CityViewModel
    @State private var orientation = UIDeviceOrientation.unknown
    var body: some View {
        Group {
            if viewModel.isLoading {
                ProgressView("loading".localized)
                    .progressViewStyle(CircularProgressViewStyle())
            } else {
                if orientation.isPortrait {
                    List(viewModel.filterList, id: \.id) { item in
                        NavigationLink(destination: MapView(viewModel: viewModel.selectedCity(item: item))) {
                            Text(item.title)
                                .foregroundColor(.black)
                        }
                    }
                    .listStyle(.plain)
                    .searchable(text: $viewModel.clueText, placement: .navigationBarDrawer(displayMode: .always), prompt: "filter".localized)
                } else {
                    HStack {
                        List(viewModel.filterList, id: \.id) { item in
                            Text(item.title)
                                .foregroundColor(.black)
                        }
                        .listStyle(.plain)
                        .searchable(text: $viewModel.clueText, placement: .navigationBarDrawer(displayMode: .always), prompt: "filter".localized)
                        MapView(viewModel: MapViewModel(city: nil))
                    }
                }
            }
        }
        .onRotate { newOrientation in
                orientation = newOrientation
        }
    }
}

#Preview {
    CityView(viewModel: CityViewModel())
}
