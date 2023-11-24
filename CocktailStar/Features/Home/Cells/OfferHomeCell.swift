//
//  OfferHomeCell.swift
//  CocktailStar
//
//  Created by Kyrylo Chernov on 24.11.2023.
//

import SwiftUI

struct OfferHomeCell: View {
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
                Image("cocktailPlaceholder")
                    .resizable()
                Text("Editor's Choice")
                    .foregroundStyle(Color.white)
            }
            .padding(.all, 10)
        }
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(.blue, lineWidth: 5)
        )
        .cornerRadius(20)
    }
}

#Preview {
    OfferHomeCell()
}
