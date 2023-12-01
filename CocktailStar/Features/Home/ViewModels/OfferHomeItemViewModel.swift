//
//  OfferHomeItemViewModel.swift
//  CocktailStar
//
//  Created by Kyrylo Chernov on 01.12.2023.
//

import Foundation

public final class OfferHomeItemViewModel: BaseHomeItemViewModel {
    public let image: String
    
    init(title: String, image: String) {
        self.image = image
        super.init(title: title)
    }
}

// MARK: Hashable
extension OfferHomeItemViewModel: Hashable {
    public func hash(into hasher: inout Hasher) {
        image.hash(into: &hasher)
        title.hash(into: &hasher)
    }
    
    
    public static func == (lhs: OfferHomeItemViewModel, rhs: OfferHomeItemViewModel) -> Bool {
        lhs.hashValue == rhs.hashValue
    }
}
