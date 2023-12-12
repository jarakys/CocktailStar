//
//  MainCoordinatorView.swift
//  CocktailStar
//
//  Created by Kyrylo Chernov on 12.12.2023.
//

import SwiftUI

struct MainCoordinatorView: View {
    @StateObject public var state: MainCoordinatorPathState
    let homeCoordinatorComponentBuilder: HomeCoordinatorComponentBuilder
    
    var body: some View {
        NavigationStack(path: $state.paths) {
            AnyView(homeCoordinatorComponentBuilder.view())
        }
    }
}
