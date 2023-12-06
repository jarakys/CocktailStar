//
//  SearchViewModel.swift
//  CocktailStar
//
//  Created by Kyrylo Chernov on 01.12.2023.
//

import Foundation
import Combine

final class SearchViewModel: BaseViewModel {
    @Published public var searchText = ""
    @Published public var sections = [SearchSectionModel]()
    
    private var sectionsCancellable = Set<AnyCancellable>()
    
    override init() {
        sections = [SearchSectionModel(type: .latest, items: Self.mockedItems),
                    SearchSectionModel(type: .popular, items: Self.popularItems)]
        super.init()
        
        // TODO load items from userDefaults
    }
    
    override func bind() {
        $searchText.sink(receiveValue: { [weak self] text in
            guard let self else { return }
        }).store(in: &cancellable)
        
        let items = sections.first(where: { $0.type == .latest })?.items ?? []
        // TODO: Consider optimization
        items.forEach({ searchModel in
           searchModel.sender.sink(receiveValue: { [weak self, weak searchModel] event in
               guard let self else { return }
               guard event == .removeDidTap else { return }
               guard let searchModel else { return }
               self.sections.first(where: { $0.type == .latest })?.items.removeAll(where: { $0.id == searchModel.id })
               self.objectWillChange.send()
           }).store(in: &sectionsCancellable)
        })
        
        // TODO: Add service for fetching items
//        $items.sink(receiveValue: { [weak self] items in
//            guard let self else { return }
//        }).store(in: &cancellable)
    }
}