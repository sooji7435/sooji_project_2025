//
//  ToggleManage.swift
//  Revolt
//
//  Created by 박윤수 on 3/17/25.
//

import Foundation
import SwiftUI

struct CheckToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        ZStack {
            Button {
                configuration.isOn.toggle()
            } label: {
                Label {
                    configuration.label
                } icon: {
                    Image(systemName: configuration.isOn ? "checkmark.square.fill" : "square")
                        .foregroundStyle(configuration.isOn ? Color.accentColor : .secondary)
                        .accessibility(label: Text(configuration.isOn ? "Checked" : "Unchecked"))
                        .imageScale(.large)
                }
            }
            .buttonStyle(.plain)
        }
    }
}

extension ToggleStyle where Self == CheckToggleStyle {
    static var checklist: CheckToggleStyle { .init() }
}
