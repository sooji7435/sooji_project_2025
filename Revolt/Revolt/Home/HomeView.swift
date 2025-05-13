import SwiftUI

struct HomeView: View {
    @FocusState private var isFocused: Bool
    @ObservedObject private var viewModel = Load()
    
    
    var body: some View {
        NavigationStack {
                VStack {
                    SearchBar(searchText: $viewModel.searchText)
                        .padding()
                        .focused($isFocused)
                    
                    if isFocused {
                        EVListView(viewModel: viewModel, searchText: $viewModel.searchText)
                       
                    } else {
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
                }
                .animation(.spring(), value: isFocused)
                .navigationTitle(isFocused ? "" : "EVCar")
                .navigationBarBackButtonHidden(true)
            }
    }
}

#Preview {
    HomeView()
}



