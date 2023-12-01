//
//  ScreenSections.swift
//  CocktailStar
//
//  Created by Kyrylo Chernov on 24.11.2023.
//

import Foundation

public enum ScreenSections: CaseIterable {
    case offers
    case favorites
    case categories
    case proposals
    case appNews
    
    var title: String? {
        switch self {
        case .offers:
            return nil
            
        case .favorites:
            return "Favorites"
            
        case .categories:
            return "Categories"
            
        case .proposals:
            return "Proposals"
            
        case .appNews:
            return nil
        }
    }
}
