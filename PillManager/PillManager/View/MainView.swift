//
//  ContentView.swift
//  PillManager
//
//  Created by 박윤수 on 5/31/25.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            Tab("Requests", systemImage: "paperplane") {
                _CalendarView()
            }


            Tab("Account", systemImage: "person.crop.circle.fill") {
                EmptyView()
            }


            TabSection("Messages") {
                Tab("Received", systemImage: "tray.and.arrow.down.fill") {
                    EmptyView()
                }


                Tab("Sent", systemImage: "tray.and.arrow.up.fill") {
                    EmptyView()
                }


                Tab("Drafts", systemImage: "pencil") {
                    EmptyView()
                }
            }
        }
        .tabViewStyle(.sidebarAdaptable)
    }
}

#Preview {
    MainView()
}
