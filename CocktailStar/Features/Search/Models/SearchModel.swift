//
//  SearchModel.swift
//  CocktailStar
//
//  Created by Kyrylo Chernov on 01.12.2023.
//

import Foundation
import Combine

final class SearchModel {
    public let id: UUID
    public let text: String
    public let isRemoveable: Bool
    public let sender = PassthroughSubject<SearchModel.Event, Never>()
    
    init(id: UUID, text: String, isRemoveable: Bool) {
        self.id = id
        self.text = text
        self.isRemoveable = isRemoveable
    }
    
    public func removeDidTap() {
        sender.send(.removeDidTap)
    }
}

// MARK: Event
extension SearchModel {
    enum Event {
        case removeDidTap
    }
}
