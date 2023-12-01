//
//  SearchView.swift
//  CocktailStar
//
//  Created by Kyrylo Chernov on 01.12.2023.
//

import SwiftUI

struct SearchView: View {
    @StateObject public var viewModel: SearchViewModel
    
    var body: some View {
        VStack {
            NavigationStack
            SearchBarView(searchText: $viewModel.searchText)
            List(viewModel.items, id: \.id) { item in
                SearchCell(viewModel: item)
            }
        }
    }
}

#Preview {
    SearchView(viewModel: SearchViewModel())
}
