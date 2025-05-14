import SwiftUI
import CoreML

struct EVListView: View {
    @ObservedObject var load: Load
    @ObservedObject var filter: Filtering
    @Binding var searchText: String
    @State var showSearchBar: Bool = false
    @FocusState private var isFocused: Bool

    
    var body: some View {
        NavigationStack {
            VStack {
                SearchBar(searchText: $searchText)
                    .padding()
                    .focused($isFocused)
                    .onAppear {
                        isFocused = true
                    }
                
                FilterView(load: load, filter: filter)
                
                Divider()

                if filter.filteredRecords.isEmpty {
                    Spacer()
                    Text("검색 결과가 없습니다.")
                        .foregroundColor(.gray)
                        .padding()
                    Spacer()
                } else {
                    ScrollView {
                        LazyVStack(spacing: 16) {
                            ForEach(filter.filteredRecords) { record in
                                NavigationLink(destination: EVDetailView(record: record)) {
                                    EVCardView(record: record, likedIDs: $load.likedIDs) {}
                                }
                            }
                        }
                        .padding()
                    }
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(true)

        }
    }
}
