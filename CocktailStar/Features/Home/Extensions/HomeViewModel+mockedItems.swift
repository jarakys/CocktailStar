//
//  HomeViewModel+mockedItems.swift
//  CocktailStar
//
//  Created by Kyrylo Chernov on 01.12.2023.
//

import Foundation

extension HomeViewModel {
    static let mockedItems: [GenericSectionIdentifierModel] = [
        .init(sectionIdentifier: HomeItemSectionModel(type: .offers), cellIdentifiers: 
                [.offer(viewModel: OfferHomeItemViewModel(title: "Editor choise", image: "https://spirits-navigator.com/wp-content/uploads/2020/03/bdf2fd92a54e27878511cd54036ef662.jpg")),
                 .offer(viewModel: OfferHomeItemViewModel(title: "Season choise", image: "https://zira.uz/wp-content/uploads/2018/12/glintvey-bezalkogolniy-2.jpg"))
                ]),
        .init(sectionIdentifier: HomeItemSectionModel(type: .categories), cellIdentifiers:
                [.category(viewModel: CategoryHomeItemViewModel(title: "Classic", image: "https://ezrabrooks.com/wp-content/uploads/2018/07/5-classic-cocktails-blog-1.png")),
                 .category(viewModel: CategoryHomeItemViewModel(title: "Tropical", image: nil)),
                 .category(viewModel: CategoryHomeItemViewModel(title: "Non-alcoholic", image: nil))
                ])
    ]
}
