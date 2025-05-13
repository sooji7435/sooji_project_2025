import SwiftUI
import CoreML

struct EVListView: View {
    @StateObject private var viewModel = Load()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(spacing: 16) {
                    ForEach(viewModel.records) { record in
                        NavigationLink(destination: EVDetailView(record: record)) {
                            EVCardView(record: record, likedIDs: $viewModel.likedIDs) {
                            }
                        }
                    }
                }
                .padding()
            }
            .navigationTitle("전기차 목록")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}


#Preview {
    EVListView()
}
