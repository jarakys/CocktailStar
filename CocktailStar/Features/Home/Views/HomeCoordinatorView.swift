import SwiftUI
import NavigationTransitions

struct HomeCoordinatorView: View {
    @StateObject public var viewModel: HomeCoordinatorViewModel
    @EnvironmentObject public var state: MainCoordinatorPathState
    
    var body: some View {
        HomeView(viewModel: HomeViewModel(navigationSender: viewModel.navigationSender))
            .navigationDestination(for: HomeFlowScreen.self, destination: { flow in
                switch flow {
                case .search:
                    SearchView(viewModel: viewModel.getSearchViewModel())
                    
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
                    
                case let .catalogCoordinator(searchText):
                    CatalogCoordinatorView()
                }
            })
            .onReceive(viewModel.navigationSender.delay(for: 0.1, scheduler: RunLoop.main), perform: { flow in
                switch flow {
                case .search:
                    state.append(screen: HomeFlowScreen.search)
                    
                case .offer:
                    state.append(screen: HomeFlowScreen.offer)
                    
                case .plainCategories:
                    state.append(screen: HomeFlowScreen.plainCategories)
                    
                case .list:
                    state.append(screen: HomeFlowScreen.list)
                    
                case .item:
                    state.append(screen: HomeFlowScreen.item)
                    
                case let .catalog(searchText):
                    state.append(screen: HomeFlowScreen.catalogCoordinator(searchText: searchText))
                    
                case .back:
                    state.pop()
                }
            })
    }
}
