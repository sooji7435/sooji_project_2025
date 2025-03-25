//
//  AlertSettingView.swift
//  Revolt
//
//  Created by 박윤수 on 3/25/25.
//

import SwiftUI

struct AlertSettingView: View {
    @State private var isAlert: Bool = false
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            Toggle(isOn: $isAlert) {
                Text("· 찜한 차 가격이 바뀌면 알려드려요.\n· 관심 있는 모델 매물을 추천해 드려요.")
            }
            .padding()
            
            Spacer()
            
            .navigationTitle("알림 설정")
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button(action: {dismiss() }) {
                            Image(systemName: "chevron.left")
                            .foregroundStyle(.black)
                    }
                }
            }
        }
    }
}

#Preview {
    AlertSettingView()
}
