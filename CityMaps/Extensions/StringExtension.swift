//
//  StringExtensions.swift
//  CityMaps
//
//  Created by Martin Valorzi on 22/08/2024.
//

import Foundation

extension String {
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
}
