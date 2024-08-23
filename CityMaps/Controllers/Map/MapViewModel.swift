// 
//  MapViewModel.swift
//  CityMaps
//
//  Created by Martin Valorzi on 22/08/2024.
//

import SwiftUI
import MapKit

final class MapViewModel: ObservableObject {
    @Published var city : City?
    @Published var position: MapCameraPosition

    init(city: City?) {
        self.city = city
        self.position = MapCameraPosition.region(MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: city?.coordinate.latitude ?? 0, longitude: city?.coordinate.longitude ?? 0), span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1)))
    }

    func continueAction() {
    }
}
