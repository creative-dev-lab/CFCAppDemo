//
//  SearchTextField.swift
//  CFCAppDemo
//
//  Created by King on 2/17/23.
//

import SwiftUI

struct SearchTextField: View {
    @Binding var text: String
    @Binding var isEditing: Bool

    var body: some View {
        HStack {
            Image("ic_search")
                .resizable()
                .scaledToFit()
                .foregroundColor(Color("primary"))
                .frame(width: 16, height: 16)
                .padding(.trailing, 10)

            TextField(
                "To (Destination)",
                text: $text,
                onEditingChanged: { editingChanged in
                    isEditing = editingChanged
                }
            )
            .tint(Color("primary"))
            .foregroundColor(Color("primary"))
            .font(.system(size: 16))
            .padding(.trailing, 10)
            .keyboardType(.default)
            .disableAutocorrection(true)
            .ignoresSafeArea(.keyboard, edges: .bottom)
        }
        .padding(20)
        .background(Capsule().fill(Color("surface")))
        .shadow(radius: 3)
        .overlay(
            RoundedRectangle(cornerRadius: 30)
                .stroke(
                    Color("primary"),
                    lineWidth: isEditing ? 2 : 0)
        )
    }
}

struct SearchTextField_Previews: PreviewProvider {
    static var previews: some View {
        SearchTextField(text: .constant(""), isEditing: .constant(false))
    }
}
