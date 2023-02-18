//
//  SearchListView.swift
//  CFCAppDemo
//
//  Created by King on 2/17/23.
//

import SwiftUI

struct SearchListView: View {
    var list: [SearchResult]
    @Binding var selectedItem: SearchResult?

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            ForEach(Array(list), id: \.self) { item in
                Button(action: {
                    selectedItem = item
                }, label: {
                    Text("\(item.municipality) (\(item.iataCode)) - \(item.airportName)")
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
            list: [
                SearchResult.example
            ],
            selectedItem: .constant(SearchResult.example)
        )
    }
}
