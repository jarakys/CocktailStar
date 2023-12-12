//
//  RootComponent.swift
//  CocktailStar
//
//  Created by Kyrylo Chernov on 12.12.2023.
//

import SwiftUI
import NeedleFoundation

final class RootComponent: BootstrapComponent, RootComponentBuilder {
    public var pathsState: MainCoordinatorPathState {
        shared { MainCoordinatorPathState() }
    }
    
    func homeCoordinatorComponentBuilder() -> HomeCoordinatorComponentBuilder {
        HomeCoordinatorComponent(parent: self)
    }
    
    func view() -> any View {
        MainCoordinatorView(state: self.pathsState, homeCoordinatorComponentBuilder: homeCoordinatorComponentBuilder())
    }
}
