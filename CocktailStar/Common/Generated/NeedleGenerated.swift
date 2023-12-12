

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
private class HomeDependency1a613161fbeb7325bc1fProvider: HomeDependency {
    var navigationSender: PassthroughSubject<HomeFlowEvent, Never> {
        return homeCoordinatorComponent.navigationSender
    }
    private let homeCoordinatorComponent: HomeCoordinatorComponent
    init(homeCoordinatorComponent: HomeCoordinatorComponent) {
        self.homeCoordinatorComponent = homeCoordinatorComponent
    }
}
/// ^->RootComponent->HomeCoordinatorComponent->HomeComponent
private func factory995a82ec20f5d1ce6b16c1891ffb9cad4f220a7a(_ component: NeedleFoundation.Scope) -> AnyObject {
    return HomeDependency1a613161fbeb7325bc1fProvider(homeCoordinatorComponent: parent1(component) as! HomeCoordinatorComponent)
}

#else
extension HomeCoordinatorComponent: Registration {
    public func registerItems() {
        keyPathToName[\HomeCoordinatorDependency.pathsState] = "pathsState-MainCoordinatorPathState"
        localTable["navigationSender-PassthroughSubject<HomeFlowEvent, Never>"] = { [unowned self] in self.navigationSender as Any }
        localTable["communicationEvent-PassthroughSubject<HomeCommunicationEvent, Never>"] = { [unowned self] in self.communicationEvent as Any }
    }
}
extension HomeComponent: Registration {
    public func registerItems() {
        keyPathToName[\HomeDependency.navigationSender] = "navigationSender-PassthroughSubject<HomeFlowEvent, Never>"
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
    registerProviderFactory("^->RootComponent->HomeCoordinatorComponent->HomeComponent", factory995a82ec20f5d1ce6b16c1891ffb9cad4f220a7a)
    registerProviderFactory("^->RootComponent", factoryEmptyDependencyProvider)
}
#endif

public func registerProviderFactories() {
#if !NEEDLE_DYNAMIC
    register1()
#endif
}
