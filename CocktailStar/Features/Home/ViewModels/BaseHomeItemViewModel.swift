//
//  BaseHomeItemViewModel.swift
//  CocktailStar
//
//  Created by Kyrylo Chernov on 27.11.2023.
//

import Foundation

public class BaseHomeItemViewModel: ObservableObject {
    public let title: String
    
    init(title: String) {
        self.title = title
    }
}
