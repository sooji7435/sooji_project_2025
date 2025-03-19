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
                .padding(10)
                    .background(Color(.systemGray6))
                    .cornerRadius(3)
                    .padding(.horizontal)
                }
        
        
        Button(action:{}) {
            ZStack {
                Image("certification")
                    .resizable()
                    .frame(width: 250, height: 350)
                    .cornerRadius(3)
                
                Text("오직 전기차를 위한\n리볼트 인증 과정\n\n인증과정 보기. >")
                    .foregroundStyle(.black)
                
            }
        }
            }
    }

#Preview {
    HomeView()
}
