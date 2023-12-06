//
//  SearchCell.swift
//  CocktailStar
//
//  Created by Kyrylo Chernov on 01.12.2023.
//

import SwiftUI
import Combine

struct SearchCell: View {
    public let viewModel: SearchModel
    var body: some View {
        HStack {
            Text(viewModel.text)
                .frame(maxWidth: .infinity, alignment: .leading)
            if viewModel.isRemoveable {
                Spacer()
                Image(systemName: "xmark")
                    .foregroundStyle(.white)
                    .onTapGesture {
                        viewModel.removeDidTap()
                    }
            }
        }
        
    }
}

#Preview {
    SearchCell(viewModel: SearchModel(id: UUID(), text: "", isRemoveable: false))
}
