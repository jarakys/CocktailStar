//
//  HomeView.swift
//  CocktailStar
//
//  Created by Kyrylo Chernov on 24.11.2023.
//

import SwiftUI
import CompositionalList

struct HomeView: View {
    private var items: [GenericSectionIdentifierModel] = [
        .init(sectionIdentifier: .init(type: .offers), cellIdentifiers: [BaseHomeItemViewModel(image: "cocktailPlaceholder", title: "Editor's choise"), BaseHomeItemViewModel(image: "cocktailPlaceholder", title: "Editor's choise")]),
        .init(sectionIdentifier: .init(type: .favorites), cellIdentifiers: [BaseHomeItemViewModel(image: "cocktailPlaceholder", title: "Editor's choise"),
                                                                            BaseHomeItemViewModel(image: "cocktailPlaceholder", title: "Editor's choise"),BaseHomeItemViewModel(image: "cocktailPlaceholder", title: "Editor's choise")])]
    var body: some View {
        ZStack {
            CompositionalList(items) { model, indexPath in
                switch ScreenSections.allCases[indexPath.section] {
                case .offers:
                    OfferHomeCell()
                case .favorites:
                    OfferHomeCell()
                default:
                    Text("Hui")
                }
            }.sectionHeader { sectionIdentifier, kind, indexPath in
                getView(for: sectionIdentifier.type)
            }
            .selectedItem { _ in
                
            }
            .customLayout(.composed(sections: [.offers, .favorites, .proposals]))
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
    HomeView()
}
