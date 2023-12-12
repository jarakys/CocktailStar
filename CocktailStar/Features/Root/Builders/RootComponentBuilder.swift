//
//  RootComponentBuilder.swift
//  CocktailStar
//
//  Created by Kyrylo Chernov on 12.12.2023.
//

import SwiftUI

protocol RootComponentBuilder {
    func view() -> any View
    func homeCoordinatorComponentBuilder() -> HomeCoordinatorComponentBuilder
}
