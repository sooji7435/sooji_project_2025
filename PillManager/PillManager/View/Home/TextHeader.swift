//
//  TextHeader.swift
//  PillManager
//
//  Created by 박윤수 on 6/2/25.
//

import SwiftUI

struct TextHeader: View {
    private var UserName: String = "최연우"
    var body: some View {
        HStack(alignment: .firstTextBaseline) {
            Text("반갑습니다\n\(UserName)님")
                .font(Font.custom("나눔손글씨 꽃내음", size: 30))
                .multilineTextAlignment(.leading)
                .padding()
            Spacer()
        }

    }
}

#Preview {
    TextHeader()
}
