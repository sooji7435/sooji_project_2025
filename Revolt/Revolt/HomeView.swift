//
//  HomeView.swift
//  Revolt
//
//  Created by 박윤수 on 3/18/25.
//

import SwiftUI

struct HomeView: View {
    @State var search: String = ""
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.black)
                        TextField(text: $search) {
                            Text("어떤 전기차를 찾으시나요?")
                                .foregroundColor(.black)
                        }
                        .foregroundColor(Color.black)
                        .textFieldStyle(.plain)
                        
                    }
                    .padding(20)
                    .background(Color(.systemGray6))
                    .cornerRadius(3)
                    .padding(.horizontal)
                    
                    .padding(.bottom, 40)
                    
                    VStack(spacing: 20) {
                        Button(action:{}) {
                            ZStack(alignment: .topLeading) {
                                Image("certification")
                                    .resizable()
                                    .frame(width: 250, height: 350)
                                    .cornerRadius(3)
                                
                                Text("오직 전기차를 위한\n리볼트 인증 과정\n\n인증과정 보기    >")
                                    .foregroundStyle(.white)
                                    .font(.system(size: 15, weight: .bold, design: .default))
                                    .multilineTextAlignment(.leading)
                                    .padding()
                            }
                        }
                       
                        
                        
                        Button(action:{}) {
                            ZStack(alignment: .topLeading) {
                                Image("charging")
                                    .resizable()
                                    .frame(width: 250, height: 350)
                                    .cornerRadius(3)
                                
                                Text("역시 똑똑한 사람들은\n전기차를 좋아해\n\n전기차가 특별한 이유    >")
                                    .foregroundStyle(.black)
                                    .font(.system(size: 15, weight: .bold, design: .default))
                                    .multilineTextAlignment(.leading)
                                    .padding()
                            }
                        }
                        
                        Button(action:{}) {
                            ZStack(alignment: .topLeading) {
                                Image("charging")
                                    .resizable()
                                    .frame(width: 250, height: 350)
                                    .cornerRadius(3)
                                
                                Text("역시 똑똑한 사람들은\n전기차를 좋아해\n\n전기차가 특별한 이유    >")
                                    .foregroundStyle(.black)
                                    .font(.system(size: 15, weight: .bold, design: .default))
                                    .multilineTextAlignment(.leading)
                                    .padding()
                            }
                        }
                    }
                    
                }
            }
            .onTapGesture {
                
            }
            .navigationTitle(Text("revolt"))
        }
    }
    
}

#Preview {
    HomeView()
}
