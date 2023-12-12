//
//  CatalogCoordinatorView.swift
//  CocktailStar
//
//  Created by Kyrylo Chernov on 12.12.2023.
//

import SwiftUI

struct CatalogCoordinatorView: View {
    var body: some View {
        CatalogView(viewModel: CatalogViewModel())
    }
}

#Preview {
    CatalogCoordinatorView()
}
