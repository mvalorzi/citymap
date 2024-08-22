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
    @Published var clueText = ""
    @Published var filterList = [DataListItem]()
    var service = MapService()

    func filterResults() {
        if clueText.isEmpty {
            filterList = setupFilterList()
            return
        }
        let clue = clueText.lowercased()
        let resultList = cities.filter({($0.name?.lowercased() ?? "").contains(clue)})
        filterList.removeAll()
        for item in resultList {
            filterList.append(DataListItem(id: item.id, title: item.name ?? ""))
        }
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
