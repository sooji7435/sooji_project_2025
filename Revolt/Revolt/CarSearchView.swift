//
//  SwiftUIView.swift
//  Revolt
//
//  Created by 박윤수 on 3/30/25.
//

import SwiftUI

struct CarSearchView: View {
    @StateObject private var viewModel = CarSearchViewModel()
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    TextField("차 번호 검색", text: $viewModel.searchText)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()

                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Image(systemName: "xmark")
                            .foregroundColor(.gray)
                            .padding()
                    }
                }

                ScrollView {
                    ForEach(Dictionary(grouping: viewModel.filteredCars, by: { $0.brand }).sorted(by: { $0.key < $1.key }), id: \.key) { brand, cars in
                        Section(header: Text(brand).font(.headline).padding(.leading)) {
                            ForEach(cars) { car in
                                CarRow(car: car)
                            }
                        }
                    }
                }

                Button(action: {
                    // 전체 차량 보기 기능 추가
                }) {
                    Text("44대 보기")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.black)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .padding()
                }
            }
            .navigationBarHidden(true)
        }
    }
}


#Preview {
    CarSearchView()
}
