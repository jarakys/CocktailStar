//
//  SearchCell.swift
//  CocktailStar
//
//  Created by Kyrylo Chernov on 01.12.2023.
//

import SwiftUI

struct SearchCell: View {
    public let viewModel: SearchModel
    var body: some View {
        Text(viewModel.text)
            .frame(maxWidth: .infinity, alignment: .center)
    }
}

#Preview {
    SearchCell(viewModel: SearchModel(id: UUID(), text: ""))
}
