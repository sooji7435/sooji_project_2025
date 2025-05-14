//
//  Question.swift
//  Revolt
//
//  Created by 박윤수 on 3/25/25.
//

import SwiftUI

struct QuestionView: View {
    @Environment(\.dismiss) var dismiss
    
    @State var expanded1: Bool = false
    @State var expanded2: Bool = false
    @State var expanded3: Bool = false
    @State var expanded4: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 30) {
                Text("자주 묻는 질문")
                    .multilineTextAlignment(.leading)
                    .foregroundStyle(.black)
                    .font(.system(size: 20, weight: .bold, design: .default))
                    .padding(.bottom)
                
                DisclosureGroup("헤이딜러가 만들었나요?", isExpanded: $expanded1) {
                    Text("네, 맞습니다\n\n내차팔기 서비스 헤이딜러는 중고차 시장을 고객\n중심으로 바꿔나가고 있는데요.\n\n고객분들이 전기차를 안심하고 구입할 수 있도록\n하기 위해서 서비스를 만들었습니다.")
                        .font(.system(size: 14, weight: .light, design: .default))
                        .lineSpacing(5)
                        .padding()
                        .background(Color.gray.opacity(0.1))
                }
                .foregroundStyle(.black)
                .font(.system(size: 17, weight: .light))
                .accentColor(.black)
                .disclosureGroupStyle(CustomDisclosureStyle())
                
                DisclosureGroup("리볼트 인증차, 어떻게 진단하나요?", isExpanded: $expanded2) {
                    
                }
                .foregroundStyle(.black)
                .font(.system(size: 17, weight: .light))
                .accentColor(.black)
                .disclosureGroupStyle(CustomDisclosureStyle())
                
                DisclosureGroup("어떻게 구매할 수 있나요?", isExpanded: $expanded3) {
                    
                }
                .foregroundStyle(.black)
                .font(.system(size: 17, weight: .light))
                .accentColor(.black)
                .disclosureGroupStyle(CustomDisclosureStyle())
                
                DisclosureGroup("구매 후 단순변심도 환불이 되나요?", isExpanded: $expanded4) {
                    
                }
                .foregroundStyle(.black)
                .font(.system(size: 17, weight: .light))
                .accentColor(.black)
                .disclosureGroupStyle(CustomDisclosureStyle())
            }
            .padding(40)
            
            Spacer()
            
                .navigationBarBackButtonHidden(true)
                .toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        Button(action: {dismiss() }) {
                                Image(systemName: "chevron.left")
                                .foregroundStyle(.black)
                        }
                    }
                }
            
        }
    }
}

#Preview {
    QuestionView()
}
