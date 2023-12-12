//
//  HomeCoordinatorComponent.swift
//  CocktailStar
//
//  Created by Kyrylo Chernov on 12.12.2023.
//

import SwiftUI
import Combine
import NeedleFoundation

final class HomeCoordinatorComponent: Component<HomeCoordinatorDependency>, HomeCoordinatorComponentBuilder {
    
    private var viewModel: HomeCoordinatorViewModel {
        HomeCoordinatorViewModel(navigationSender: navigationSender,
                                 communicationEvent: communicationEvent)
    }
    
    public var navigationSender: PassthroughSubject<HomeFlowEvent, Never> {
        shared { PassthroughSubject<HomeFlowEvent, Never>() }
    }
    
    public var communicationEvent: PassthroughSubject<HomeCommunicationEvent, Never> {
        shared { PassthroughSubject<HomeCommunicationEvent, Never>() }
    }
    
    func view() -> any View {
        HomeCoordinatorView(viewModel: self.viewModel, homeBuilder: homeBuilder())
            .environmentObject(self.pathsState)
    }
    
    func homeBuilder() -> HomeBuilder {
        HomeComponent(parent: self)
    }
}
