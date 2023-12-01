//
//  CategoryHomeCell.swift
//  CocktailStar
//
//  Created by Kyrylo Chernov on 01.12.2023.
//

import SwiftUI

struct CategoryHomeCell: View {
    public let viewModel: CategoryHomeItemViewModel
    
    var body: some View {
        VStack {
            Text(viewModel.title)
                .foregroundStyle(.white)
                .fontWeight(.bold)
                .font(.title)
                .multilineTextAlignment(.center)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.green)
    }
}

#Preview {
    CategoryHomeCell(viewModel: CategoryHomeItemViewModel(title: "Classic cocktails", image: nil))
}
