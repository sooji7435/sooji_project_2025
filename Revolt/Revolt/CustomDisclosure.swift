//
//  ToggleManage.swift
//  Revolt
//
//  Created by 박윤수 on 3/17/25.
//

import Foundation
import SwiftUI

struct CustomDisclosureStyle: DisclosureGroupStyle {
    func makeBody(configuration: Configuration) -> some View {
        VStack {
            Button {
                withAnimation {
                    configuration.isExpanded.toggle()
                }
            } label: {
                HStack {
                    configuration.label
                    Spacer()
                    Image(systemName: "chevron.down") // 기본 ▼
                        .rotationEffect(.degrees(configuration.isExpanded ? -180 : 0)) // 펼치면 ▶
                        .animation(.easeInOut, value: configuration.isExpanded)
                }
                .contentShape(Rectangle())
            }
            .buttonStyle(.plain)
            
            if configuration.isExpanded {
                configuration.content
            }
        }
    }
}
