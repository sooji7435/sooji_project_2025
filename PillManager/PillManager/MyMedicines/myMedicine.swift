//
//  myMedicine.swift
//  PillManager
//
//  Created by 박윤수 on 6/25/25.
//

import SwiftUI

struct myMedicine: View {
    
    
    var body: some View {
            ScrollView(.horizontal) {
                HStack {
                    
                    Button(action: {}) {
                        VStack {
                            Image(systemName: "plus")
                                .resizable()
                                .frame(width: 44, height: 44)
                                .padding()
                                .background(Color.gray.opacity(0.1))
                                .clipShape(Circle())
                                .foregroundStyle(Color.gray)
                            
                            Text("Add new")
                                .foregroundStyle(Color.gray)
                                .font(Font.custom("나눔손글씨 맛있는체", size: 24))
                        }
                    }
                    MedicineIconView()
                }
            }
            .navigationTitle(Text("My Medicine"))
        }
    }


#Preview {
    myMedicine()
}
