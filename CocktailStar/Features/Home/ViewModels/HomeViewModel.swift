//
//  HomeViewModel.swift
//  CocktailStar
//
//  Created by Kyrylo Chernov on 01.12.2023.
//

import Foundation
import Combine

final class HomeViewModel: BaseViewModel {
    @Published public var items = [GenericSectionIdentifierModel]()
    
    public var sections: [ScreenSections] {
        items.map({ $0.sectionIdentifier.type })
    }
    
    override init() {
        items = Self.mockedItems
        super.init()
    }
}
