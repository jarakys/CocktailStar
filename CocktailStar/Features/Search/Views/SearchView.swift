//
//  SearchView.swift
//  CocktailStar
//
//  Created by Kyrylo Chernov on 01.12.2023.
//

import SwiftUI
import NavigationTransitions

struct SearchView: View {
    @StateObject public var viewModel: SearchViewModel
    
    var body: some View {
        VStack {
            SearchBarView(searchText: $viewModel.searchText)
            List(viewModel.items, id: \.id) { item in
                SearchCell(viewModel: item)
            }
        }
        .navigationTransition(.fade(.cross))
    }
}

#Preview {
    SearchView(viewModel: SearchViewModel())
}
