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
        NavigationView {
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
                    .background(Color(.systemGray6)) // 배경색 설정
                    .cornerRadius(2) // 모서리 둥글게
                    .padding(.horizontal)
                }
            }
            
            
            .navigationTitle("revolt")
        }
        
    }

#Preview {
    HomeView()
}
