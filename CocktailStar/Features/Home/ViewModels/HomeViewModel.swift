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
    private let navigationSender: PassthroughSubject<HomeFlowEvent, Never>
    
    init(navigationSender: PassthroughSubject<HomeFlowEvent, Never>) {
        self.navigationSender = navigationSender
        items = Self.mockedItems
        super.init()
    }
    
    public var sections: [ScreenSections] {
        items.map({ $0.sectionIdentifier.type })
    }
    
    public func searchDidTap() {
        navigationSender.send(.search)
    }
}
