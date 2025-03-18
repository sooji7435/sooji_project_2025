//
//  TabView.swift
//  Revolt
//
//  Created by 박윤수 on 3/18/25.
//

import SwiftUI

struct _Tab: View {
    var body: some View {
        TabView {
            Tab("Home", systemImage: "house") {
                HomeView()
            }
            
            Tab("search", systemImage: "magnifyingglass") {
                HomeView()
            }
            
            Tab("favorite", systemImage: "heart.fill") {
                HomeView()
            }
            
            Tab("profile", systemImage: "person.circle.fill") {
                HomeView()
            }
        }
        .accentColor(.black)
    }
}

#Preview {
    _Tab()
}
