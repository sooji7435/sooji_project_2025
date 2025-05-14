//
//  TabView.swift
//  Revolt
//
//  Created by 박윤수 on 3/18/25.
//

import SwiftUI

struct _Tab: View {
    @State private var selectionTab: String = "home"
    @StateObject private var load = Load()
    @StateObject private var filter = Filtering()
    
    var body: some View {
        TabView(selection: $selectionTab) {
            HomeView(load: load, selectionTab: $selectionTab, filter: filter )
                .tag("home")
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            
            EVListView(load: load, filter: filter, searchText: $filter.searchText )
                .tag("search")
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                }
            
            FavoriteView(load: load, evrecord: load.records)
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
        .tint(.black)
        .onAppear {
                filter.sourceRecords = load.records
        }
    }
    
}

#Preview {
    _Tab()
}
