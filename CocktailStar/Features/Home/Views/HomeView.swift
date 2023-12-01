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
        NavigationStack {
            ZStack {
                VStack {
                    SearchBarView(searchText: Binding<String>(projectedValue: .constant("")))
                        .foregroundStyle(.white)
                        .padding(.horizontal, 16)
                        .disabled(true)
                        .onTapGesture {
                            viewModel.searchDidTap()
                        }
                    CompositionalList(viewModel.items) { model, indexPath in
                        switch model {
                        case let .offer(viewModel):
                            OfferHomeCell(viewModel: viewModel)
                            
                        case .favorite:
                            EmptyView()
                            
                        case let .category(viewModel):
                            CategoryHomeCell(viewModel: viewModel)
                        }
                    }.sectionHeader { sectionIdentifier, kind, indexPath in
                        getView(for: sectionIdentifier.type)
                    }
                    .selectedItem { _ in
                        
                    }
                    .customLayout(.composed(sections: viewModel.sections))
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.mainBackground)
        }
    }
}

// MARK: View fabric
extension HomeView {
    public func getView(for section: ScreenSections) -> some View {
        switch section {
        case .offers:
            return AnyView(EmptyView())
        default: return AnyView(
            HomeExpandedHeaderView(title: section.title)
                .padding(.top, 20)
        )
        }
    }
}

#Preview {
    HomeView(viewModel: HomeViewModel())
}
