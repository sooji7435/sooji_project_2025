import SwiftUI

struct HomeView: View {
    @FocusState private var isFocused: Bool
    @Binding var selectedTab: String
    
    var body: some View {
        NavigationStack {
                VStack {
                    SearchBar()
                        .focused($isFocused)
                        .onTapGesture {
                            selectedTab = "search"
                        }
                    
                    if isFocused {
                        
                        EVListView()
                        
                       
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
    HomeView(selectedTab: .constant(""))
}




