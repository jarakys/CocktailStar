//
//  CategoryHomeCell.swift
//  CocktailStar
//
//  Created by Kyrylo Chernov on 01.12.2023.
//

import SwiftUI

struct CategoryHomeCell: View {
    public let title: String
    var body: some View {
        VStack {
            Text(title)
                .foregroundStyle(.white)
                .fontWeight(.bold)
                .font(.title)
        }
        .background(.regularMaterial)
    }
}

#Preview {
    CategoryHomeCell(title: "Hello")
}
