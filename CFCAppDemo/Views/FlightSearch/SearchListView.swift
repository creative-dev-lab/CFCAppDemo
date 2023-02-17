//
//  SearchListView.swift
//  CFCAppDemo
//
//  Created by King on 2/17/23.
//

import SwiftUI

struct SearchListView: View {
    var list: [String]
    @Binding var selectedItem: String

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            ForEach(Array(list).sorted(by: <), id: \.self) { item in
                Button(action: {
                    selectedItem = item
                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to:nil, from:nil, for:nil)
                }, label: {
                    Text(item)
                        .foregroundColor(Color("primary"))
                        .font(.system(size: 16))
                        .padding(.horizontal, 10)
                        .frame(maxWidth: .infinity, alignment: .leading)
                })
            }
        }
        .frame(alignment: .leading)
    }
}

struct SearchListView_Previews: PreviewProvider {
    static var previews: some View {
        SearchListView(
            list: ["New York", "London", "Biggin Hill"],
            selectedItem: .constant("New York")
        )
    }
}
