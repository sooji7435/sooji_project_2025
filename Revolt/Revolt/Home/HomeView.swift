import SwiftUI

struct HomeView: View {
    @FocusState private var isFocused: Bool
    @Binding var searchText: String
    var body: some View {
        NavigationStack {
                VStack {
                    SearchBar(searchText: $searchText)
                        .padding()
                        .focused($isFocused)
                    
                    if isFocused {
                        EVListView(searchText: $searchText)
                       
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
                    }
                }
                .onTapGesture { isFocused = false }
                .animation(.spring(), value: isFocused)
                .navigationTitle(isFocused ? "" : "EVCar")
                .navigationBarBackButtonHidden(true)
            }
    }
}

#Preview {
    HomeView(searchText: .constant(""))
}



