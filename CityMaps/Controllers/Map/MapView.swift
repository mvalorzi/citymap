// 
//  MapView.swift
//  CityMaps
//
//  Created by Martin Valorzi on 22/08/2024.
//

import SwiftUI
import MapKit

struct MapView: View {
    @ObservedObject var viewModel: MapViewModel
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Map(position: $viewModel.position)
                    .mapStyle(.hybrid(elevation: .realistic))
            }
        }
        .padding()
    }
}

#Preview {
    MapView(viewModel: MapViewModel(city: City(id: -1, coordinate: CityCoordinate(latitude: 51.507222, longitude: -0.1275))))
}
