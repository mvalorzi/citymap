//
//  CityMapsApp.swift
//  CityMaps
//
//  Created by Martin Valorzi on 21/08/2024.
//

import SwiftUI

@main
struct CityMapsApp: App {
    var body: some Scene {
        WindowGroup {
            GeometryReader { geometry in
                WelcomeView(viewModel: WelcomeViewModel())
            }
        }
    }
}


