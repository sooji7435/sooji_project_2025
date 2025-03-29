//
//  SurveyView.swift
//  Revolt
//
//  Created by 박윤수 on 3/26/25.
//

import SwiftUI

struct SurveyView: View {
    @State private var answer: String = ""
    
    @Binding var isShowing: Bool
    
    @FocusState private var isFocused: Bool
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                VStack(alignment: .leading, spacing: -10) {
                    Text("리볼트에서\n경험은 어떠셨나요?")
                        .font(.system(size: 22, weight: .bold, design: .default))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .fixedSize(horizontal: false, vertical: true)
                        .lineLimit(nil)
                        .padding()
                    
                    Text("남겨주신 의견은 서비스 개선에 소중히 활용하겠습니다.")
                        .font(.system(size: 16, weight: .regular, design: .default))
                        .padding()
                }
                
                ZStack(alignment: .topLeading){
                    TextEditor(text: $answer)
                        .frame(height: 120)
                        .font(.system(size: 14, weight: .regular, design: .default))
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 3)
                                .stroke(Color.gray, lineWidth: 1)
                        )
                        .focused($isFocused)
                        .padding()
                    
                    if answer.isEmpty && !isFocused {
                        Text("솔직한 답변 들려주세요.")
                            .foregroundStyle(.gray)
                            .padding()
                            .padding()
                    }
                    
                }
                
                .onTapGesture {
                    isFocused = true
                }
                .onChange(of: isFocused) {_, newValue in
                    if !newValue && answer.isEmpty {
                        isFocused = false
                    }
                    
                }
                
                if answer.isEmpty {
                        Text("의견 남기기")
                            .foregroundStyle(Color(.systemGray3))
                            .frame(maxWidth: .infinity, maxHeight: 50)
                            .background(Color(.systemGray6))
                            .cornerRadius(3)
                            .padding()
                    
                } else {
                    Button(action: {}) {
                        Text("의견 남기기")
                            .foregroundStyle(.white)
                            .frame(maxWidth: .infinity, maxHeight: 50)
                            .background(.black)
                            .cornerRadius(3)
                            .padding()
                    }
                }
                
            }
            .toolbar{
                ToolbarItem(placement: .topBarLeading) {
                    Button(action:{isShowing = false}) {
                        Image(systemName: "xmark")
                            .foregroundStyle(.black)
                    }
                }
            }
        }
    }
}

#Preview {
    SurveyView(isShowing: .constant(true))
}
