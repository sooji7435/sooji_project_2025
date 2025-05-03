//
//  StartView.swift
//  Revolt
//
//  Created by 박윤수 on 3/17/25.
//

import SwiftUI

struct StartView: View {
    @State var isShowing: Bool = false
    @State var shouldNavigate: Bool = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                Image("StartView")
                    .resizable()
                    .ignoresSafeArea(edges: .all)
                VStack{
                    Spacer()
                    
                    Button(action: {
                        isShowing.toggle()
                    }){
                        ZStack {
                            Rectangle()
                                .fill(Color.white)
                                .frame(width: 300, height: 50)
                                .cornerRadius(5)
                            Text("시작하기  >")
                                .foregroundColor(.black)
                        }
                    }
                }
            }
                .sheet(isPresented: $isShowing) {
                    BottomSheet(isShow: $isShowing, shouldNavigate: $shouldNavigate)
                        .presentationDetents([.medium])
                        .presentationDragIndicator(.visible)
                }
                .navigationDestination(isPresented: $shouldNavigate) {
                    _Tab()
                }
                
            }
        }
    }

#Preview {
    StartView()
}
