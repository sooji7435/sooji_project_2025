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
                                .background(Color.Color4.opacity(0.2))
                                .clipShape(Circle())
                                .foregroundStyle(Color.gray)
                            
                            Text("추가")
                                .foregroundStyle(Color.gray)
                                .font(Font.custom("나눔손글씨 맛있는체", size: 24))
                        }
                    }
                    MedicineIconView()
                }
            }
            .navigationTitle(Text("내 일정"))
        }
    }


#Preview {
    myMedicine()
}
