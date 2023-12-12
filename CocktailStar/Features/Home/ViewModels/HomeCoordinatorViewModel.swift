//
//  HomeCoordinatorViewModel.swift
//  CocktailStar
//
//  Created by Kyrylo Chernov on 05.12.2023.
//

import Foundation
import Combine

final class HomeCoordinatorViewModel: BaseViewModel {
    // For different animation of navigation transition and for state
    @Published public var currentScreen = HomeFlowScreen.home
    public let navigationSender = PassthroughSubject<HomeFlowEvent, Never>()
    public let communicationEvent = PassthroughSubject<HomeCommunicationEvent, Never>()
    
    override init() {
        super.init()
    }
    
    //TODO: Move to Dependency?
    //TODO: Consider refactoring
    public func getSearchViewModel() -> SearchViewModel {
        let viewModel = SearchViewModel()
        viewModel.navigationSender.sink(receiveValue: { [weak self] event in
            switch event {
            case let .searchDone(searchText):
                self?.navigationSender.send(.catalog(searchText: searchText))
            }
        }).store(in: &cancellable)
        return viewModel
    }
    
    override func bind() {
        // For different animation of navigation transition
        navigationSender.sink(receiveValue: { [weak self] event in
            guard let self else { return }
            switch event {
            case .search:
                currentScreen = .search
                
            case .offer:
                currentScreen = .offer
                
            case .plainCategories:
                currentScreen = .plainCategories
                
            case .list:
                currentScreen = .list
                
            case .item:
                currentScreen = .item
                
            case .catalog, .back: break
            }
        }).store(in: &cancellable)
        
        communicationEvent.sink(receiveValue: { [weak self] event in
            guard let self else { return }
        }).store(in: &cancellable)
    }
}
