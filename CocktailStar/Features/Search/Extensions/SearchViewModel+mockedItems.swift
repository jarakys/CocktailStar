//
//  SearchViewModel+mockedItems.swift
//  CocktailStar
//
//  Created by Kyrylo Chernov on 01.12.2023.
//

import Foundation

extension SearchViewModel {
    static let mockedItems: [SearchModel] = [
        SearchModel(id: UUID(), text: "Ice cocktail", isRemoveable: true),
        SearchModel(id: UUID(), text: "Whiskey sour", isRemoveable: true),
        SearchModel(id: UUID(), text: "Margarita", isRemoveable: true)
    ]
    
    static let popularItems: [SearchModel] = [
        SearchModel(id: UUID(), text: "Nice cocktails", isRemoveable: false),
        SearchModel(id: UUID(), text: "Winter cocktails", isRemoveable: false)
    ]
}
