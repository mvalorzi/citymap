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
            if viewModel.isLoading {
                ProgressView("loading".localized)
                    .progressViewStyle(CircularProgressViewStyle())
            } else {
                    List(viewModel.filterList, id: \.id) { item in
                        NavigationLink(destination: MapView(viewModel: viewModel.selectedCity(item: item))) {
                            Text(item.title)
                                .foregroundColor(.black)
                        }
                    }
                    .listStyle(.plain)
                    .searchable(text: $viewModel.clueText, placement: .navigationBarDrawer(displayMode: .always), prompt: "filter".localized)
                }
    }
}

#Preview {
    CityView(viewModel: CityViewModel())
}
