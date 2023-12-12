//
//  HomeFlowEvent.swift
//  CocktailStar
//
//  Created by Kyrylo Chernov on 05.12.2023.
//

import Foundation

enum HomeFlowEvent: Hashable {
    case search
    case offer
    case plainCategories
    case list
    case catalog(searchText: String)
    case item
    case back
}
