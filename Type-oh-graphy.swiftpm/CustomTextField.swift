//
//  CustomTextField.swift
//  Type-oh-graphy
//
//  Created by Ye Eun Choi on 2023/04/07.
//

import SwiftUI


// MARK: - Custom TextField
struct CustomTextFieldStyle: TextFieldStyle {
    @FocusState private var textFieldIsFocused: Bool
    
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding(16)
            .background(textFieldIsFocused ? .white : Color(.systemGray6))
            .cornerRadius(10)
            .focused($textFieldIsFocused)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.accentColor.opacity(textFieldIsFocused ? 1.0 : 0.0), lineWidth: 1.5)
            )
            .padding(3)
            .overlay(
                RoundedRectangle(cornerRadius: 13)
                    .stroke(Color.accentColor.opacity(textFieldIsFocused ? 0.2 : 0.0), lineWidth: 5)
            )
    }
}
