//
//  SearchViewModel+mockedItems.swift
//  CocktailStar
//
//  Created by Kyrylo Chernov on 01.12.2023.
//

import Foundation

extension SearchViewModel {
    static let mockedItems: [SearchModel] = [
        SearchModel(id: UUID(), text: "Ice cocktail"),
        SearchModel(id: UUID(), text: "Whiskey sour"),
        SearchModel(id: UUID(), text: "Margarita")
    ]
}
