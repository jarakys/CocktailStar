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
        .init(sectionIdentifier: .init(type: .offers), cellIdentifiers: [BaseHomeItemViewModel(image: "cocktailPlaceholder", title: "Editor's choise"), BaseHomeItemViewModel(image: "cocktailPlaceholder", title: "Editor's choise")])]
    var body: some View {
        ZStack {
            CompositionalList(items) { model, indexPath in
                switch ScreenSections.allCases[indexPath.section] {
                case .offers:
                    OfferHomeCell()
                default:
                    Text("Hui")
                }
            }.sectionHeader { sectionIdentifier, kind, indexPath in
                EmptyView()
            }
            .selectedItem { _ in
                
            }
            .customLayout(.composed(sections: [.offers]))
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.mainBackground)
    }
}

#Preview {
    HomeView()
}
