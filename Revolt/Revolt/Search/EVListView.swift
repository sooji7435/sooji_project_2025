import SwiftUI

struct EVListView: View {
    @State private var records: [EVRecord] = []
    @State private var isLoading: Bool = true
    @State private var likedIDs: Set<String> = []

    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(spacing: 16) {
                    ForEach(records) { record in
                        NavigationLink(destination: EVDetailView(record: record)) {
                            EVCardView(record: record, likedIDs: $likedIDs)
                        }
                    }
                }
                .padding()
            }
            .navigationTitle("전기차 목록")
            .navigationBarTitleDisplayMode(.inline)
            .onAppear {
                if records.isEmpty {
                    loadJSONInChunks(from: "list", chunkSize: 1000, onChunk: { chunk in
                        self.records.append(contentsOf: chunk)
                    }, onFinish: {
                        self.isLoading = false
                    })
                }
            }
        }
    }
}


#Preview {
    EVListView()
}
