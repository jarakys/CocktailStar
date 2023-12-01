//
//  HomeView.swift
//  CocktailStar
//
//  Created by Kyrylo Chernov on 24.11.2023.
//

import SwiftUI
import CompositionalList

struct HomeView: View {
    @StateObject public var viewModel: HomeViewModel
    
    var body: some View {
        ZStack {
            CompositionalList(viewModel.items) { model, indexPath in
                switch model {
                case let .offer(viewModel):
                    OfferHomeCell(viewModel: viewModel)
                    
                case .favorite:
                    CategoryHomeCell(title: "Title")
                    
                case .category:
                    CategoryHomeCell(title: "Title")
                }
            }.sectionHeader { sectionIdentifier, kind, indexPath in
                getView(for: sectionIdentifier.type)
            }
            .selectedItem { _ in
                
            }
            .customLayout(.composed(sections: viewModel.sections))
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.mainBackground)
    }
}

// MARK: View fabric
extension HomeView {
    public func getView(for section: ScreenSections) -> some View {
        switch section {
        case .offers:
            return AnyView(EmptyView())
        default: return AnyView(
            HomeExpandedHeaderView()
                .padding(.top, 20)
        )
        }
    }
}

#Preview {
    HomeView(viewModel: HomeViewModel())
}
