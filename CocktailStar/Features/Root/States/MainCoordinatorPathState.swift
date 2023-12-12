//
//  MainCoordinatorPathState.swift
//  CocktailStar
//
//  Created by Kyrylo Chernov on 12.12.2023.
//

import Foundation
import SwiftUI

class MainCoordinatorPathState: ObservableObject {
    @Published public var paths = NavigationPath()
    
    public func append(screen: any Hashable) {
        paths.append(screen)
    }
    
    public func pop() {
        paths.removeLast()
    }
    
    public func popToRoot() {
        paths = NavigationPath()
    }
}
