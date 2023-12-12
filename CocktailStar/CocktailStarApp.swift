//
//  CocktailStarApp.swift
//  CocktailStar
//
//  Created by Kyrylo Chernov on 22.11.2023.
//

import SwiftUI
import NeedleFoundation

@main
struct CocktailStarApp: App {
    let rootComponent: RootComponent
    
    init() {
        registerProviderFactories()
        rootComponent = RootComponent()
    }
    
    var body: some Scene {
        WindowGroup {
            AnyView(rootComponent.view())
        }
    }
}
