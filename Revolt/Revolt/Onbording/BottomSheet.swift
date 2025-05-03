//
//  BottmSheet.swift
//  Revolt
//
//  Created by 박윤수 on 3/17/25.
//

import SwiftUI

struct BottomSheet: View {
    @State var isAll: Bool = false
    @State var isAge: Bool = false
    @State var isAllow: Bool = false
    
    @Binding var isShow: Bool
    @Binding var shouldNavigate: Bool
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("리볼트 이용을 위해\n동의가 필요해요.")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                    .font(.system(size: 24, weight: .bold))
                    .fontWeight(.bold)
                
                VStack {
                    ZStack {
                        Toggle(isOn: $isAll) {
                            ZStack {
                                Text("모두 동의합니다.")
                            }
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .toggleStyle(.checklist)
                        .padding([.horizontal], 10)
                        .onChange(of: isAll) {
                            isAge = isAll
                            isAllow = isAll
                        }
                    }
                    .padding([.vertical],20)
                    .background(Color(.systemGray6))
                    .cornerRadius(3)
                    .padding(.horizontal, 25)
                    
                    Toggle(isOn: $isAge) {
                        Text(" [필수] 만 14세 이상")
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .toggleStyle(.checklist)
                    .padding([.top, .horizontal], 20)
                    
                    Toggle(isOn: $isAllow) {
                        Text(" [필수] 만 14세 이상")
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .toggleStyle(.checklist)
                    .padding([.top, .horizontal], 20)
                    
                    
                    
                    ZStack {
                        if isAge && isAllow {
                            Button(action: {
                                isShow = false
                                shouldNavigate = true
                            }){
                                Text("약관 동의하기")
                                    .frame(maxWidth: .infinity, maxHeight: 60)
                                    .foregroundColor(Color.white)
                                    .background(.black)
                                    .cornerRadius(3)
                                    .padding()
                            }
                        } else {
                            Text("약관 동의하기")
                                .frame(maxWidth: .infinity, maxHeight: 60)
                                .foregroundColor(Color.white)
                                .background(Color(.systemGray3))
                                .cornerRadius(3)
                                .padding()
                        }
                    }
                }
                .offset(x: 0, y: 50)
            }
            
            
        }
    }
}

#Preview {
    BottomSheet(isShow: .constant(false), shouldNavigate: .constant(false))
}
