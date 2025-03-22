//
//  HomeView.swift
//  Revolt
//
//  Created by 박윤수 on 3/18/25.
//

import SwiftUI

struct HomeView: View {
    @State var search: String = ""
    @State var expanded1: Bool = false
    @State var expanded2: Bool = false
    @State var expanded3: Bool = false
    @State var expanded4: Bool = false
    
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
                    
                }
                VStack(alignment: .leading, spacing: 30) {
                    Text("자주 묻는 질문")
                        .multilineTextAlignment(.leading)
                        .foregroundStyle(.black)
                        .font(.system(size: 20, weight: .bold, design: .default))
                        .padding(.vertical)
                    
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
            }
            
            .navigationTitle(Text("revolt"))
        }
    }
    
}

#Preview {
    HomeView()
}
