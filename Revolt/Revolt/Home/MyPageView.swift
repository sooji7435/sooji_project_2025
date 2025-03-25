//
//  MyPageView.swift
//  Revolt
//
//  Created by 박윤수 on 3/24/25.
//

import SwiftUI

struct MyPageView: View {
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                   
                    Button(action: {}) {
                        Text("채팅 문의")
                            .font(.system(size: 15, weight: .bold, design: .default))
                            .foregroundStyle(.black)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color(.systemGray6))
                            .cornerRadius(3)
                    }
                    
                    NavigationLink(destination: QuestionView()) {
                                Text("자주 묻는 질문")
                                    .font(.system(size: 15, weight: .bold, design: .default))
                                    .foregroundStyle(.black)
                                    .frame(maxWidth: .infinity)
                                    .padding()
                                    .background(Color(.systemGray6))
                                    .cornerRadius(3)
    
                        }
                    
                    
                }
                .padding()
            }
            
            Button(action: {}) {
                HStack {
                    Text("찜한 차")
                        .foregroundStyle(.black)
                    Spacer()
                    
                    Text(">")
                        .foregroundStyle(.black)
                }
                }
            .padding()
            
            Button(action: {}) {
                HStack {
                    Text("최근 본 차")
                        .foregroundStyle(.black)
                    Spacer()
                    
                    Text(">")
                        .foregroundStyle(.black)
                }
                }
            .padding()
            
            Divider()
                .padding()
            
            Button(action: {}) {
                HStack {
                    Text("알림 설정")
                        .foregroundStyle(.black)
                    Spacer()
                    
                    Text(">")
                        .foregroundStyle(.black)
                }
                }
            .padding()
            
            Button(action: {}) {
                HStack {
                    Text("공지사항")
                        .foregroundStyle(.black)
                    Spacer()
                    
                    Text(">")
                        .foregroundStyle(.black)
                }
                }
            .padding()
            
            Button(action: {}) {
                HStack {
                    Text("앱 정보")
                        .foregroundStyle(.black)
                    Spacer()
                    
                    Text(">")
                        .foregroundStyle(.black)
                }
                }
            .padding()
            
            Button(action: {}) {
                HStack {
                VStack(alignment: .leading) {
                    Text("리볼트에서의 경험은 어떠셨나요?")
                        .foregroundStyle(.black)
                        .font(.system(size: 14, weight: .bold))
                    
                    Text("솔직한 이야기를 들려주세요.")
                        .foregroundStyle(.black)
                        .font(.system(size: 12))
                        .padding(.top, 0.1)
                    
                }
                    
   
                    
                    Image("Cloud")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .padding(.leading, 80)
            }

            }
            .padding()
            .overlay(
                RoundedRectangle(cornerRadius: 3)
                    .stroke(Color.black, lineWidth: 1)
            )
            
            Spacer()
            
            
            .navigationTitle("마이페이지")
        }
        
        
    }
}

#Preview {
    MyPageView()
}
