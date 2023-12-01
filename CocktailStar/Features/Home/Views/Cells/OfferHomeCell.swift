//
//  OfferHomeCell.swift
//  CocktailStar
//
//  Created by Kyrylo Chernov on 24.11.2023.
//

import SwiftUI
import Kingfisher

struct OfferHomeCell: View {
    public let viewModel: OfferHomeItemViewModel
    
    var body: some View {
        ZStack {
            BlurView(style: .regular)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .mask {
                    LinearGradient(
                        colors: [
                            Color.black.opacity(0),
                            Color.black.opacity(1),
                        ],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                }
            VStack(spacing: 8) {
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
                Text("Editor's Choice")
                    .foregroundStyle(Color.red)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 20)
            }
            .padding(.bottom, 20)
        }
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(.blue, lineWidth: 5)
        )
        .cornerRadius(20)
    }
}

#Preview {
    OfferHomeCell(viewModel: OfferHomeItemViewModel(title: "Editor choise", image: "https://zira.uz/wp-content/uploads/2018/12/glintvey-bezalkogolniy-2.jpg"))
}
