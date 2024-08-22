//
//  MapService.swift
//  CityMaps
//
//  Created by Martin Valorzi on 21/08/2024.
//

import Foundation

class MapService {
    typealias CityResponse = (Result<[City], Error>) -> ()
    let cityUrl = "https://gist.githubusercontent.com/hernan-uala/dce8843a8edbe0b0018b32e137bc2b3a/raw/0996accf70cb0ca0e16f9a99e0ee185fafca7af1/cities.json"

    func readCities(completion: @escaping CityResponse) {
            guard let url = URL(string: cityUrl) else { return }
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let error = error {
                    completion(.failure(error))
                    return
                }
                guard let data = data else { return }
                do {
                    let decodedData = try JSONDecoder().decode([City].self, from: data)
                    DispatchQueue.main.async {
                        completion(.success(decodedData))
                    }
                } catch {
                    completion(.failure(error))
                }
            }.resume()
    }
}
