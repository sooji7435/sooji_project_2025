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
    
    var body: some View {
        VStack {
            Text("리볼트 이용을 위해\n동의가 필요해요.")
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .font(.system(size: 24, weight: .bold))
                .fontWeight(.bold)
                
            VStack {
                ZStack {
                    Rectangle()
                        .fill(Color.gray)
                        .opacity(0.1)
                        .frame(width: 350, height: 50)
                        .cornerRadius(3)
                    
                    Toggle(isOn: $isAll) {
                        ZStack {
                            Text("모두 동의합니다.")
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .toggleStyle(.checklist)
                    .padding([.horizontal], 30)
                    .onChange(of: isAll) {
                        isAge = isAll
                        isAllow = isAll
                    }
                }
                Toggle(isOn: $isAge) {
                    Text("[필수] 만 14세 이상")
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .toggleStyle(.checklist)
                .padding([.top, .horizontal], 20)
                
                Toggle(isOn: $isAllow) {
                    Text("[필수] 만 14세 이상")
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .toggleStyle(.checklist)
                .padding([.top, .horizontal], 20)
                
                
                Button(action:{}) {
                    ZStack {
                        if isAge && isAllow {
                            Rectangle()
                                .fill(Color.black)
                                .frame(width: 350, height: 50)
                                .cornerRadius(3)
                            
                            Text("약관 동의하기")
                                .foregroundColor(Color.white)
                        }
                        else if isAll {
                            Rectangle()
                                .fill(Color.black)
                                .frame(width: 350, height: 50)
                                .cornerRadius(3)
                            
                            Text("약관 동의하기")
                                .foregroundColor(Color.white)
                        }
                        else {
                            Rectangle()
                                .fill(Color.gray)
                                .frame(width: 350, height: 50)
                                .opacity(0.4)
                            
                            Text("약관 동의하기")
                                .foregroundColor(Color.gray)
                        }
                    }
                }
                .offset(x: 0, y: 50)
            }
            
            
        }
    }
}

#Preview {
    BottomSheet()
}
