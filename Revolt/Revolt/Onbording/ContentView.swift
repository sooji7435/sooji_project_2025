//
//  ContentView.swift
//  Revolt
//
//  Created by 박윤수 on 3/17/25.
//

import SwiftUI

struct ContentView: View {
    @State private var isLaunch: Bool = true
    @State private var isShowingSheet: Bool = false
    
    var body: some View {
        VStack {
            if !isLaunch {
                StartView()
                    .transition(.opacity)
            }
            
            if isLaunch {
                LaunchView()
                    .onAppear {
                        withAnimation(.easeOut(duration: 0.5)) {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                            self.isLaunch = false
                        }
                        }
                    }
            }
        }
        
        
    }
}

#Preview {
    ContentView()
}
