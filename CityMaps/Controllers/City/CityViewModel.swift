// 
//  MapViewModel.swift
//  CityMaps
//
//  Created by Martin Valorzi on 21/08/2024.
//

import Foundation
import MapKit

final class CityViewModel: ObservableObject {
    var cities = [City]()
    @Published var filterList = [DataListItem]()
    @Published var isLoading = false
    @Published var clueText = ""
    @Published var selectedCity : City?

    var service = MapService()

    func setupFilterList() -> [DataListItem] {
        var dataList = [DataListItem]()
        for city in cities {
            dataList.append(DataListItem(id: city.id, title: "\(city.name ?? ""), \(city.country ?? "")", value: city.name?.lowercased() ?? ""))
        }
        return dataList.sorted(by: { $0.title < $1.title })
    }

    func changeCity(item: DataListItem) {
        selectedCity = cities.first(where: {$0.id == item.id})
    }

    func selectCity(item: DataListItem) -> MapViewModel {
        MapViewModel(city: cities.first(where: {$0.id == item.id}))
    }

    init() {
        isLoading = true
        service.readCities() { [weak self] result in
            switch result {
            case .success(let cities):
                self?.cities = cities
                self?.filterList = self?.setupFilterList() ?? []
                self?.isLoading = false
            case .failure(let error):
                self?.isLoading = false
                print(error)
            }
        }
    }
}
