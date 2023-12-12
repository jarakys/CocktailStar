//
//  CatalogView.swift
//  CocktailStar
//
//  Created by Kyrylo Chernov on 11.12.2023.
//

import SwiftUI

struct CatalogView: View {
    @StateObject public var viewModel: CatalogViewModel
    var body: some View {
        VStack {
            SearchBarView(searchText: .constant(""))
            List(viewModel.items, id: \.id) { item in
                CatalogCell(viewModel: item)
                    .frame(maxWidth: .infinity)
                    .frame(height: 100)
                    .listRowBackground(Color.mainBackground)
            }
            .scrollContentBackground(.hidden)
            .listStyle(.plain)
        }
        .padding(.horizontal, 16)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.mainBackground)
    }
}

#Preview {
    CatalogView(viewModel: CatalogViewModel())
}
