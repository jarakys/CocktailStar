//
//  BaseHomeItemViewModel.swift
//  CocktailStar
//
//  Created by Kyrylo Chernov on 27.11.2023.
//

import Foundation

public class BaseHomeItemViewModel: ObservableObject {
    public let image: String
    public let title: String
    
    init(image: String, title: String) {
        self.image = image
        self.title = title
    }
}

// MARK: Hashable
extension BaseHomeItemViewModel: Hashable {
    public static func == (lhs: BaseHomeItemViewModel, rhs: BaseHomeItemViewModel) -> Bool {
        lhs.image == rhs.image && lhs.title == rhs.title
    }
    
    public func hash(into hasher: inout Hasher) {
        image.hash(into: &hasher)
        title.hash(into: &hasher)
    }
}
