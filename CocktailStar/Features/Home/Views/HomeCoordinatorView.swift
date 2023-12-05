//
//  HomeCoordinatorView.swift
//  CocktailStar
//
//  Created by Kyrylo Chernov on 05.12.2023.
//

import SwiftUI
import NavigationTransitions

struct HomeCoordinatorView: View {
    @StateObject public var viewModel: HomeCoordinatorViewModel
    
    var body: some View {
        NavigationStack(path: $viewModel.paths) {
            HomeView(viewModel: HomeViewModel(navigationSender: viewModel.navigationSender))
                .navigationDestination(for: HomeFlowScreen.self, destination: { flow in
                    switch flow {
                    case .search:
                        Text("Search")
                        
                    case .item:
                        Text("Item")
                        
                    case .list:
                        Text("List")
                        
                    case .offer:
                        Text("Offer")
                        
                    case .plainCategories:
                        Text("Plain categories")
                        
                    case .home:
                        HomeView(viewModel: HomeViewModel(navigationSender: viewModel.navigationSender))
                    }
                })
        }
        .if(viewModel.currentScreen == .search, transform: { view in
            view
                .navigationTransition(.fade(.cross))
        })
    }
}

#Preview {
    HomeCoordinatorView(viewModel: HomeCoordinatorViewModel())
}


extension View {
    /// Applies the given transform if the given condition evaluates to `true`.
    /// - Parameters:
    ///   - condition: The condition to evaluate.
    ///   - transform: The transform to apply to the source `View`.
    /// - Returns: Either the original `View` or the modified `View` if the condition is `true`.
    @ViewBuilder func `if`<Content: View>(_ condition: @autoclosure () -> Bool, transform: (Self) -> Content) -> some View {
        if condition() {
            transform(self)
        } else {
            self
        }
    }
}
