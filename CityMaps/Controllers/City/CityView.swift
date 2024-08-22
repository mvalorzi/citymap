// 
//  MapView.swift
//  CityMaps
//
//  Created by Martin Valorzi on 21/08/2024.
//

import SwiftUI
struct CityView: View {
    @ObservedObject var viewModel: CityViewModel
    var body: some View {
            if viewModel.isLoading {
                ProgressView("loading".localized)
                    .progressViewStyle(CircularProgressViewStyle())
            } else {
                VStack {
                    TextField("filter".localized, text: $viewModel.clueText)
                    .modifier(ModifierFinder(text: $viewModel.clueText))
                    .background(Color(.systemGray6))
                    .cornerRadius(8)
                    .onChange(of: viewModel.clueText) {
                        viewModel.filterResults()
                    }
                    NavigationView {
                            List(viewModel.filterList) { item in
                                HStack {
                                    Text(item.title)
                                        .foregroundColor(.black)
                                }
                                .onTapGesture {
                                }
                            }
                            .listStyle(PlainListStyle())
                        }
                }.padding()
            }
    }
}

#Preview {
    CityView(viewModel: CityViewModel())
}
