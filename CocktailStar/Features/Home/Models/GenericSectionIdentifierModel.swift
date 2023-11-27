//
//  GenericSectionIdentifierModel.swift
//  CocktailStar
//
//  Created by Kyrylo Chernov on 27.11.2023.
//

import Foundation
import CompositionalList

public struct GenericSectionIdentifierModel: SectionIdentifierViewModel {
    public var sectionIdentifier: HomeItemSectionModel
    
    public var cellIdentifiers: [BaseHomeItemViewModel]
}
