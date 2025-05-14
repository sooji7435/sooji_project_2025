import SwiftUI

struct HomeView: View {
    @FocusState private var isFocused: Bool
    @ObservedObject var load: Load
    @Binding var selectionTab: String
    @ObservedObject var filter: Filtering
    
    
    var body: some View {
        NavigationStack {
                VStack {
                    SearchBar(searchText: $filter.searchText)
                        .padding()
                        .focused($isFocused)
                        .onChange(of: isFocused) { _, newValue in
                            if newValue {
                                withAnimation {
                                    selectionTab = "search"
                                }
                            }
                        }
                    
                        ScrollView {
                            ImageButton()
                            
                            Divider()
                                .frame(height: 3)
                                .background(Color.gray)
                                .opacity(0.2)
                                .padding(.top, 35)
                            
                            QuestionView()
                        }
                        .onTapGesture { isFocused = false }
                    
                }
                .navigationTitle(isFocused ? "" : "EVCar")
                .navigationBarBackButtonHidden(true)
            }
    }
}





