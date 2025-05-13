import SwiftUI

struct HomeView: View {
    @FocusState private var isFocused: Bool
    @ObservedObject private var viewModel = Load()
    @Binding var selectionTab: String
    
    
    var body: some View {
        NavigationStack {
                VStack {
                    SearchBar(searchText: $viewModel.searchText)
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

#Preview {
    HomeView(selectionTab: .constant(""))
}




