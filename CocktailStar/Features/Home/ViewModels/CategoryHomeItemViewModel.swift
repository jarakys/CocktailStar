//
//  CategoryHomeItemViewModel.swift
//  CocktailStar
//
//  Created by Kyrylo Chernov on 01.12.2023.
//

import Foundation

public final class CategoryHomeItemViewModel: BaseHomeItemViewModel {
    public let image: String?
    
    init(title: String, image: String?) {
        self.image = image
        super.init(title: title)
    }
}

// MARK: Hashable
extension CategoryHomeItemViewModel: Hashable {
    public func hash(into hasher: inout Hasher) {
        image?.hash(into: &hasher)
        title.hash(into: &hasher)
    }
    
    
    public static func == (lhs: CategoryHomeItemViewModel, rhs: CategoryHomeItemViewModel) -> Bool {
        lhs.hashValue == rhs.hashValue
    }
}
