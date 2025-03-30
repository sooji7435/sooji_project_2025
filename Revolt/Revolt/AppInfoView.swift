//
//  AppInfoView.swift
//  Revolt
//
//  Created by 박윤수 on 3/30/25.
//

import SwiftUI

struct AppInfoView: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 10) {
                Text("버전 정보 1.23.0")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                
                Text("이용약관&개인정보 처리방침")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                
                Spacer()
            }
                .navigationTitle(Text("앱 정보"))
                .padding()
                .toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        HStack {
                            Button(action: {dismiss()}) {
                                Image(systemName: "xmark")
                                    .foregroundStyle(.black)
                            }
                        }
                    }
                }
        }
    }
}

#Preview {
    AppInfoView()
}
