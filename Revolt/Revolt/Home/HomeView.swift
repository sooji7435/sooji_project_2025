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
                ZStack {
                    VStack {
                        HStack {
                            Image(systemName: "magnifyingglass")
                                .foregroundStyle(.black)
                            TextField(text: $search) {
                                Text("어떤 전기차를 찾으시나요?")
                                    .foregroundStyle(.black)
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
                            .onTapGesture {
                                print("button touched")
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
                            .onTapGesture {
                                print("button touched")
                            }
                            
                            Button(action:{}) {
                                ZStack(alignment: .topLeading) {
                                    Image("carExhibition")
                                        .resizable()
                                        .frame(width: 250, height: 350)
                                        .cornerRadius(3)
                                    
                                    Text("쾌적하고 전문적인\n리볼트 쇼룸\n\n쇼룸 보기    >")
                                        .foregroundStyle(.white)
                                        .font(.system(size: 15, weight: .bold, design: .default))
                                        .multilineTextAlignment(.leading)
                                        .padding()
                                }
                            }
                            .onTapGesture {
                                print("button touched")
                            }
                            
                            Button(action:{}) {
                                ZStack(alignment: .topLeading) {
                                    Image("carBlueprint")
                                        .resizable()
                                        .frame(width: 250, height: 350)
                                        .cornerRadius(3)
                                    
                                    Text("전기차\n화제가 걱정되시나요?\n\n배터리 진단·보증보기    >")
                                        .foregroundStyle(.white)
                                        .font(.system(size: 15, weight: .bold, design: .default))
                                        .multilineTextAlignment(.leading)
                                        .padding()
                                }
                            }
                            .onTapGesture {
                                print("button touched")
                                
                            }
                        }
                        
                        Divider()
                            .frame(height: 3)
                                .background(Color.gray)
                                .opacity(0.2)
                                .padding(.top, 35)
                        
                        QuestionView()

                    }
                    
                }
               
            }
                .navigationTitle(Text("revolt"))

        }
    }
    
}

#Preview {
    HomeView()
}
