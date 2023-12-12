//
//  HomeDependency.swift
//  CocktailStar
//
//  Created by Kyrylo Chernov on 12.12.2023.
//

import Foundation
import Combine
import NeedleFoundation

protocol HomeDependency: Dependency {
    var navigationSender: PassthroughSubject<HomeFlowEvent, Never> { get }
}
