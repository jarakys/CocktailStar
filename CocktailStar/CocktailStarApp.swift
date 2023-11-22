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
    
    init() {
        registerProviderFactories()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
