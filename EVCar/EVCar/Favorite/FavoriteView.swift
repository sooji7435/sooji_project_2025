//
//  SwiftUIView.swift
//  Revolt
//
//  Created by 박윤수 on 5/13/25.
//

import SwiftUI

struct FavoriteView: View {
    
    @ObservedObject var load: Load
    var evrecord: [EVRecord]
    var favoritedrecord: [EVRecord] {
            evrecord.filter { evrecord in
                load.likedIDs.contains(evrecord.id.uuidString)
            }
        }

    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(spacing: 16) {
                    ForEach(favoritedrecord) { record in
                        NavigationLink(destination: EVDetailView(record: record)) {
                            EVCardView(record: record, likedIDs: $load.likedIDs) {}
                        }
                    }
                }
                .padding()
            }
            .navigationTitle("즐겨찾기")
        }
    }
}


