//
//  HomeCoordinatorDependency.swift
//  CocktailStar
//
//  Created by Kyrylo Chernov on 12.12.2023.
//

import Foundation
import NeedleFoundation

protocol HomeCoordinatorDependency: Dependency {
    var pathsState: MainCoordinatorPathState { get }
}
