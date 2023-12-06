//
//  SearchSectionModel.swift
//  CocktailStar
//
//  Created by Kyrylo Chernov on 06.12.2023.
//

import Foundation

class SearchSectionModel {
    public let id = UUID()
    public let type: SearchSectionType
    public var items: [SearchModel]
    
    init(type: SearchSectionType, items: [SearchModel]) {
        self.type = type
        self.items = items
    }
}
