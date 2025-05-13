import SwiftUI
import CoreML

struct EVListView: View {
    @ObservedObject var viewModel: Load
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
                
                FilterView(viewModel: viewModel)
                
                Divider()
                
                // MARK: - 리스트 영역
                if viewModel.filteredRecords.isEmpty {
                    Spacer()
                    Text("검색 결과가 없습니다.")
                        .foregroundColor(.gray)
                        .padding()
                    Spacer()
                } else {
                    ScrollView {
                        LazyVStack(spacing: 16) {
                            ForEach(viewModel.filteredRecords) { record in
                                NavigationLink(destination: EVDetailView(record: record)) {
                                    EVCardView(record: record, likedIDs: $viewModel.likedIDs) {}
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
