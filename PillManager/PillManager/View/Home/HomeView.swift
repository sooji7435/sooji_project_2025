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
                ScrollView {
                VStack {
                    TextHeader()
                    
                    _CalendarView()
                    
                     VStack{
                         HStack{
                             Text("My Medicine")
                                 .font(Font.custom("나눔손글씨 꽃내음", size: 30))
                                 .padding()
                             
                             Spacer()
                             
                             Button(action: {}) {
                                 Text("show all")
                                     .font(Font.custom("나눔손글씨 꽃내음", size: 15))
                                     .foregroundStyle(Color.gray)
                                     
                             }
                             .padding()
                         }
                        myMedicine()
                    }
                    
                    
                    
                }
                
            }
            
        }
    }
}

#Preview {
    HomeView()
}
