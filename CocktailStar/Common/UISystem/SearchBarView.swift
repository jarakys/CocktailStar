//
//  SearchBarView.swift
//  CocktailStar
//
//  Created by Kyrylo Chernov on 01.12.2023.
//

import SwiftUI

struct SearchBarView: View {
    @Binding public var searchText: String
    
    var body: some View {
        HStack {
                Image(systemName: "magnifyingglass")
                .foregroundColor(.white)
                TextField("", text: $searchText)
                    .font(Font.system(size: 21))
                    .foregroundStyle(.white)
                    .placeholder(when: searchText.isEmpty, placeholder: {
                        Text("Search here")
                            .foregroundColor(.white)
                    })
            }
            .padding(7)
            .cornerRadius(50)
    }
}

#Preview {
    SearchBarView(searchText: Binding<String>(projectedValue: .constant("")))
}
