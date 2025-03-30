//
//  CarRow.swift
//  Revolt
//
//  Created by 박윤수 on 3/30/25.
//

import SwiftUI

struct CarRow: View {
    let car: ElectricCar

    var body: some View {
        HStack {
            Image(car.imageUrl)
                .resizable()
                .frame(width: 80, height: 50)
                .clipShape(RoundedRectangle(cornerRadius: 8))

            VStack(alignment: .leading) {
                Text(car.model)
                    .font(.headline)
                if let price = car.price {
                    Text(price)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                } else {
                    Text("가격 정보 없음")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
            }

            Spacer()

            Text(car.availableCount > 0 ? "\(car.availableCount)대" : "0대")
                .foregroundColor(car.availableCount > 0 ? .green : .gray)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 2)
        .padding(.horizontal)
    }
}


#Preview {
    CarRow(car: sampleCars[0])
}
