//
//  SearchBar.swift
//  Revolt
//
//  Created by 박윤수 on 4/30/25.
//

import SwiftUI

struct SearchBar: View {
    @Binding var searchText: String
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .padding()
                .foregroundStyle(.black)
            
            TextField(text: $searchText) {
                Text("어떤 전기차를 찾으시나요?")
                    .foregroundStyle(.black)
        }
            .foregroundColor(Color.black)
            .textFieldStyle(.plain)

        
        }
        .background(Color(.systemGray6))
        .cornerRadius(3)
    }
}


