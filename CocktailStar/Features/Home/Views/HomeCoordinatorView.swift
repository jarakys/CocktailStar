import SwiftUI
import NavigationTransitions

struct HomeCoordinatorView: View {
    @StateObject public var viewModel: HomeCoordinatorViewModel
    @State var paths = NavigationPath()
    @EnvironmentObject public var state: MainCoordinatorPathState
    
    var body: some View {
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
            .if(viewModel.currentScreen == .search, transform: { view in
                view
                    .navigationTransition(.default)
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
                    
                case .back:
                    state.pop()
                }
            })
    }
}
