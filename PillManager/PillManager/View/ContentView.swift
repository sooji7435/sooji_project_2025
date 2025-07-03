//
//  ContentView.swift
//  PillManager
//
//  Created by 박윤수 on 5/31/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            Tab("Requests", systemImage: "calendar") {
                HomeView()
            }


            Tab("Account", systemImage: "cross.case") {
                EmptyView()
            }


            TabSection("Messages") {
                Tab("Received", systemImage: "bolt.heart.fill") {
                    EmptyView()
                }


                Tab("Sent", systemImage: "ellipsis") {
                    EmptyView()
                }

            }
        }
        .tabViewStyle(.sidebarAdaptable)
        .tint(.color4)
    }
}

#Preview {
    ContentView()
}
