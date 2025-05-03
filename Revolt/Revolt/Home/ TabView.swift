//
//  TabView.swift
//  Revolt
//
//  Created by 박윤수 on 3/18/25.
//

import SwiftUI

struct _Tab: View {
    @State private var isLoading: Bool = true
    @State private var selectionTab: String = "home"
    
    var body: some View {
        TabView {
            Tab("Home", systemImage: "house") {
                HomeView(selectedTab: $selectionTab)
                    .tag("home")
            }
            
            
            Tab("search", systemImage: "magnifyingglass") {
                SearchBar()
                
                EVListView()
                    .tag("search")
            }
            
            
            Tab("favorite", systemImage: "heart.fill") {
                MyPageView()
            }
            
            Tab("profile", systemImage: "person.circle.fill") {
                MyPageView()
            }
        }
        .accentColor(.black)

    }
}


#Preview {
    _Tab()
}
