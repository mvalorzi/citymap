// 
//  MapViewModel.swift
//  CityMaps
//
//  Created by Martin Valorzi on 21/08/2024.
//

import Foundation

final class CityViewModel: ObservableObject {
    var cities = [City]()
    private var initList = [DataListItem]()
    @Published var isLoading = false
    @Published var clueText = ""
    @Published var filterList = [DataListItem]()
    var service = MapService()

    func filterResults() {
        if clueText.isEmpty {
            filterList = initList
            return
        }
        let clue = clueText.lowercased()
        filterList = initList.filter({($0.value).contains(clue)})
    }

    func setupFilterList() -> [DataListItem] {
        var dataList = [DataListItem]()
        for city in cities {
            dataList.append(DataListItem(id: city.id, title: city.name ?? "", value: city.name?.lowercased() ?? ""))
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
                self?.initList = self?.filterList ?? []
                self?.isLoading = false
            case .failure(let error):
                self?.isLoading = false
                print(error)
            }
        }
    }
}
