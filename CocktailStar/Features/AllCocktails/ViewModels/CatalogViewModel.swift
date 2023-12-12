//
//  CatalogViewModel.swift
//  CocktailStar
//
//  Created by Kyrylo Chernov on 11.12.2023.
//

import Foundation
import Combine

final class CatalogViewModel: BaseViewModel {
    @Published public var items = [CatalogItemModel]()
    
    override init() {
        super.init()
        self.items = Self.mockedItems
    }
}
