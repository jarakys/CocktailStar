//
//  HomeComponent.swift
//  CocktailStar
//
//  Created by Kyrylo Chernov on 12.12.2023.
//

import SwiftUI
import NeedleFoundation

final class HomeComponent: Component<HomeDependency>, HomeBuilder {
    private var viewModel: HomeViewModel {
        HomeViewModel(navigationSender: self.navigationSender)
    }
    
    func view() -> HomeView {
        HomeView(viewModel: self.viewModel)
    }
}
