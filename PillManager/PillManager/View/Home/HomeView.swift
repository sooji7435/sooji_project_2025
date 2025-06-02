//
//  HomeView.swift
//  PillManager
//
//  Created by 박윤수 on 6/2/25.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.Color1, Color.white]),
                                       startPoint: .top, endPoint: .bottom)
                       .edgesIgnoringSafeArea(.all)
            VStack {
                TextHeader()
                
                _CalendarView()
                
                Spacer()
            }
           
        }
        
    }
}

#Preview {
    HomeView()
}
