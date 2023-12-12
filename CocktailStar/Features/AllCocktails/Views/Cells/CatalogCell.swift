//
//  CatalogCell.swift
//  CocktailStar
//
//  Created by Kyrylo Chernov on 11.12.2023.
//

import SwiftUI
import Kingfisher

struct CatalogCell: View {
    public let viewModel: CatalogItemModel
    
    var body: some View {
        ZStack {
            KFImage(URL(string: viewModel.image))
                .placeholder({
                    Image(.cocktailPlaceholder)
                        .resizable()
                })
                .interpolation(.low)
                .backgroundDecode()
                .cacheOriginalImage(false)
                .cancelOnDisappear(true)
                .resizable()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .blur(radius: 3)
            VStack(spacing: 10) {
                Text(viewModel.title)
                    .font(.largeTitle)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text(viewModel.shortDescription)
                    .font(.title3)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .foregroundStyle(.white)
        }
    }
}

#Preview {
    CatalogCell(viewModel: .init(id: 1, title: "Winter magic", image: "https://images.fineartamerica.com/images/artworkimages/mediumlarge/3/winter-magic-klaus-strubel.jpg", shortDescription: "Feel this feel again"))
}
