// 
//  MapView.swift
//  CityMaps
//
//  Created by Martin Valorzi on 21/08/2024.
//

import SwiftUI
struct CityView: View {
    @ObservedObject var viewModel: CityViewModel
    @State var isTextFieldFocused = false
    var body: some View {
        GeometryReader { geometry in
            if viewModel.isLoading {
                ProgressView("loading".localized)
                    .progressViewStyle(CircularProgressViewStyle())
            } else {
                VStack {
                    TextField("filter".localized, text: $viewModel.clueText, onEditingChanged: { editing in
                        isTextFieldFocused = editing
                    })
                    .modifier(ModifierFinder(text: $viewModel.clueText, isTextFieldFocused: $isTextFieldFocused))
                    .background(Color(.systemGray6))
                    .cornerRadius(8)
                    .onChange(of: viewModel.clueText, perform: { value in
                        viewModel.filterResults()
                    })
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
                }
            }
        }
        .padding()
    }
}

#Preview {
    CityView(viewModel: CityViewModel())
}
