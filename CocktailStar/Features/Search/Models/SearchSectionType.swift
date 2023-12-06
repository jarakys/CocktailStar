//
//  SearchSectionType.swift
//  CocktailStar
//
//  Created by Kyrylo Chernov on 06.12.2023.
//

import Foundation

enum SearchSectionType {
    case latest
    case popular
    
    var title: String {
        switch self {
        case .latest:
            return "Latest"
            
        case .popular:
            return "Popular"
        }
    }
}
