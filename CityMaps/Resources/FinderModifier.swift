//
//  FinderModifier.swift
//  CityMaps
//
//  Created by Martin Valorzi on 22/08/2024.
//

import SwiftUI

struct ModifierFinder: ViewModifier {
    @Binding var text: String
    var maxLength = -1
    func body(content: Content) -> some View {
        HStack {
            Image(.searchIcon)
                .padding(7)
            content
                .onReceive(text.publisher.collect()) {
                    if maxLength >= 0 {
                        text = String($0.prefix(maxLength))
                    }
                }
        }
    }
}

