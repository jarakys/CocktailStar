//
//  HomeCoordinatorViewModel.swift
//  CocktailStar
//
//  Created by Kyrylo Chernov on 05.12.2023.
//

import Foundation
import Combine

final class HomeCoordinatorViewModel: BaseViewModel {
    @Published public var paths = [HomeFlowScreen]()
    // For different animation of navigation transition and for state
    @Published public var currentScreen = HomeFlowScreen.home
    public let navigationSender = PassthroughSubject<HomeFlowEvent, Never>()
    public let communicationEvent = PassthroughSubject<HomeCommunicationEvent, Never>()
    
    override init() {
        super.init()
    }
    
    override func bind() {
        // Delay for different animation of navigation transition
        navigationSender.delay(for: 0.01, scheduler: RunLoop.main).sink(receiveValue: { [weak self] flow in
            guard let self else { return }
            print(flow)
            switch flow {
            case .search:
                paths.append(.search)
                
            case .offer:
                paths.append(.offer)
                
            case .plainCategories:
                paths.append(.plainCategories)
                
            case .list:
                paths.append(.list)
                
            case .item:
                paths.append(.item)
                
            case .back:
                self.back()
            }
            
        }).store(in: &cancellable)
        
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
                
            case .back: break
                
            }
        }).store(in: &cancellable)
        
        communicationEvent.sink(receiveValue: { [weak self] event in
            guard let self else { return }
        }).store(in: &cancellable)
    }
    
    // MARK: Handlers
    private func back() {
        paths.removeLast()
    }
}
