//
//  CustomLayout.swift
//  CocktailStar
//
//  Created by Kyrylo Chernov on 24.11.2023.
//

import Foundation

import UIKit

public extension UICollectionViewLayout {
    static func composed(sections: [ScreenSections]) -> UICollectionViewLayout {
        return UICollectionViewCompositionalLayout { sectionIndex, layoutEnvironment in
            let section = sections[sectionIndex]
            switch section {
            case .offers:
                return offerSection()
            default: return offerSection()
            }
        }
    }
    
    private static func offerSection() -> NSCollectionLayoutSection {
        let topNestedItemLeading = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
        topNestedItemLeading.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 8, bottom: 0, trailing: 8)
        let dailyMealGroup = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(0.85), heightDimension: .absolute(285)), subitems: [topNestedItemLeading])

        let section = NSCollectionLayoutSection(group: dailyMealGroup)
        section.contentInsets = .init(top: 0, leading: 16, bottom: 0, trailing: 16)
        section.orthogonalScrollingBehavior = .groupPaging
        return section
    }
}
