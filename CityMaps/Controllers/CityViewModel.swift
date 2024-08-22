// 
//  MapViewModel.swift
//  CityMaps
//
//  Created by Martin Valorzi on 21/08/2024.
//

import Foundation

final class CityViewModel: ObservableObject {
    var cities = [City]()
    @Published var isLoading = false
    @Published var filterList = [DataListItem]()
    var service = MapService()

    func findCity(key: String) {

    }

    func setupFilterList() -> [DataListItem] {
        var dataList = [DataListItem]()
        for city in cities {
            dataList.append(DataListItem(id: city.id, title: city.name ?? ""))
        }
        return dataList
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
