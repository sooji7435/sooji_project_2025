import SwiftUI

struct EVListView: View {
    @State private var records: [EVRecord] = []
    @State private var isLoading: Bool = true

    var body: some View {
        NavigationStack {
            ZStack {
                    ScrollView {
                        LazyVStack(spacing: 16) {
                            ForEach(records) { record in
                                NavigationLink(destination: EVDetailView(record: record)) {
                                    VStack(alignment: .leading, spacing: 4) {
                                            Text("\(record.make) \(record.model)")
                                                .font(.title3)
                                                .fontWeight(.semibold)
                                                .foregroundStyle(.black)
                                            
                                            Text("연식: \(record.modelYear) • \(record.city), \(record.state)")
                                                .font(.subheadline)
                                                .foregroundStyle(.black)
                                        }
                                        .padding()
                                        .cornerRadius(12)
                                    }
                                }
                            }
                        }
                        .padding()
                    }
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
        

#Preview {
    EVListView()
}
