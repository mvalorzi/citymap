//
//  WelcomeView.swift
//  CityMaps
//
//  Created by Martin Valorzi on 24/08/2024.
//

import SwiftUI

struct WelcomeView: View {
    @ObservedObject var viewModel: WelcomeViewModel
    @State private var orientation = UIDeviceOrientation.unknown
    var body: some View {
        GeometryReader { geometry in
            NavigationView  {
                VStack(alignment: .center) {
                    Text("welcome_header".localized)
                        .font(.headline)
                    Text("welcome_content".localized)
                        .font(.subheadline)
                    Spacer()
                    Image("background")
                    Spacer()
                    NavigationLink(destination: CityView(viewModel: CityViewModel(orientation: orientation))) {
                        Text("continue".localized)
                            .frame(width: geometry.size.width * 0.9, height: geometry.size.height * 0.05)
                            .background(.black)
                            .cornerRadius(8.0)
                                    }


                }.padding()
            }
        }.onRotate { newOrientation in
            orientation = newOrientation
    }
    }
}

#Preview {
    WelcomeView(viewModel: WelcomeViewModel())
}
