

import Combine
import Foundation
import NavigationTransitions
import NeedleFoundation
import SwiftUI

// swiftlint:disable unused_declaration
private let needleDependenciesHash : String? = nil

// MARK: - Traversal Helpers

private func parent1(_ component: NeedleFoundation.Scope) -> NeedleFoundation.Scope {
    return component.parent
}

// MARK: - Providers

#if !NEEDLE_DYNAMIC

private class HomeCoordinatorDependency40d097a9ad230c37fdc6Provider: HomeCoordinatorDependency {
    var pathsState: MainCoordinatorPathState {
        return rootComponent.pathsState
    }
    private let rootComponent: RootComponent
    init(rootComponent: RootComponent) {
        self.rootComponent = rootComponent
    }
}
/// ^->RootComponent->HomeCoordinatorComponent
private func factoryaf513d15c2be408d80e9b3a8f24c1d289f2c0f2e(_ component: NeedleFoundation.Scope) -> AnyObject {
    return HomeCoordinatorDependency40d097a9ad230c37fdc6Provider(rootComponent: parent1(component) as! RootComponent)
}

#else
extension HomeCoordinatorComponent: Registration {
    public func registerItems() {
        keyPathToName[\HomeCoordinatorDependency.pathsState] = "pathsState-MainCoordinatorPathState"
    }
}
extension RootComponent: Registration {
    public func registerItems() {

        localTable["pathsState-MainCoordinatorPathState"] = { [unowned self] in self.pathsState as Any }
    }
}


#endif

private func factoryEmptyDependencyProvider(_ component: NeedleFoundation.Scope) -> AnyObject {
    return EmptyDependencyProvider(component: component)
}

// MARK: - Registration
private func registerProviderFactory(_ componentPath: String, _ factory: @escaping (NeedleFoundation.Scope) -> AnyObject) {
    __DependencyProviderRegistry.instance.registerDependencyProviderFactory(for: componentPath, factory)
}

#if !NEEDLE_DYNAMIC

@inline(never) private func register1() {
    registerProviderFactory("^->RootComponent->HomeCoordinatorComponent", factoryaf513d15c2be408d80e9b3a8f24c1d289f2c0f2e)
    registerProviderFactory("^->RootComponent", factoryEmptyDependencyProvider)
}
#endif

public func registerProviderFactories() {
#if !NEEDLE_DYNAMIC
    register1()
#endif
}
