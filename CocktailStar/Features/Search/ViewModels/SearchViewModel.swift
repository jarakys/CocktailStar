//
//  SearchViewModel.swift
//  CocktailStar
//
//  Created by Kyrylo Chernov on 01.12.2023.
//

import Foundation

final class SearchViewModel: BaseViewModel {
    @Published public var searchText = ""
    @Published public var items = [SearchModel]()
    
    override init() {
        super.init()
        items = Self.mockedItems
        // TODO load items from userDefaults
    }
    
    override func bind() {
        $searchText.sink(receiveValue: { [weak self] text in
            guard let self else { return }
        }).store(in: &cancellable)
        
        $items.sink(receiveValue: { [weak self] items in
            guard let self else { return }
        }).store(in: &cancellable)
    }
}
