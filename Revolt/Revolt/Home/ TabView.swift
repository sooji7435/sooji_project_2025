//
//  TabView.swift
//  Revolt
//
//  Created by 박윤수 on 3/18/25.
//

import SwiftUI

struct _Tab: View {
    @State private var selectionTab: String = "home"
    @State private var searchText: String = ""
    @StateObject private var viewModel = Load()
    
    var body: some View {
        TabView {
            Tab("Home", systemImage: "house") {
                HomeView()
                    .tag("home")
            }
            
            
            Tab("search", systemImage: "magnifyingglass") {
                EVListView(viewModel: viewModel, searchText: $viewModel.searchText)
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
