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
        TabView(selection: $selectionTab) {
            HomeView(selectionTab: $selectionTab)
                .tag("home")
                .tabItem {
                    Label("Home", systemImage: "house")
                }

            EVListView(viewModel: viewModel, searchText: $viewModel.searchText)
                .tag("search")
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                }

            FavoriteView(viewModel: viewModel, evrecord: viewModel.records)
                .tag("favorite")
                .tabItem {
                    Label("Favorite", systemImage: "heart.fill")
                }
            
            MyPageView()
                .tag("profile")
                .tabItem {
                    Label("Profile", systemImage: "person.circle.fill")
                }
        }
        .accentColor(.black)
    }
}

#Preview {
    _Tab()
}
