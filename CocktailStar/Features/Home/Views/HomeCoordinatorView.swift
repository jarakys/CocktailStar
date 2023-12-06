import SwiftUI
import NavigationTransitions

struct HomeCoordinatorView: View {
    @StateObject public var viewModel: HomeCoordinatorViewModel
    
    var body: some View {
        NavigationStack(path: $viewModel.paths) {
            HomeView(viewModel: HomeViewModel(navigationSender: viewModel.navigationSender))
                .navigationDestination(for: HomeFlowScreen.self, destination: { flow in
                    switch flow {
                    case .search:
                        SearchView(viewModel: SearchViewModel())
                        
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
                    }
                })
        }
        .if(viewModel.currentScreen == .search, transform: { view in
            view
                .navigationTransition(.slide)
        })
    }
}
