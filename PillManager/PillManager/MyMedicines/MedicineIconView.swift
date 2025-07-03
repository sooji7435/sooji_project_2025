//
//  MedicineIconView.swift
//  PillManager
//
//  Created by 박윤수 on 6/30/25.
//

import SwiftUI

struct MedicineIconView: View {
    @State var medicines: [Medicines] = [Medicines(iconName: "pill_icon", name: "Omega-3", dosage: "capsule", time: Date(), status: .taken), Medicines(iconName: "doctor", name: "vitamine", dosage: "capsule", time: Date(), status: .taken)]
    
    var body: some View {
        HStack {
                ForEach (medicines) {medicine in
                    VStack {
                        Image(medicine.iconName)
                            .resizable()
                            .frame(width: 44, height: 44)
                            .padding()
                            .background(Color.Color4.opacity(0.2))
                            .clipShape(Circle())
                        
                        Text("\(medicine.name)")
                            .font(Font.custom("나눔손글씨 맛있는체", size: 24))
                        
                    }
                    .padding()
                }
            }
        }
    }


#Preview {
    MedicineIconView()
}
