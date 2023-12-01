//
//  HomeCell.swift
//  CocktailStar
//
//  Created by Kyrylo Chernov on 01.12.2023.
//

import Foundation

public enum HomeCell {
    case offer(viewModel: OfferHomeItemViewModel)
    case category(viewModel: CategoryHomeItemViewModel)
    case favorite
}

extension HomeCell: Hashable {
    public func hash(into hasher: inout Hasher) {
        switch self {
        case .offer(let viewModel):
            viewModel.hashValue.hash(into: &hasher)
            
        case .category(let viewModel):
            viewModel.hashValue.hash(into: &hasher)
            
        case .favorite:
            "u".hash(into: &hasher)
        }
    }
}
