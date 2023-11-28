//
//  HomeExpandedHeaderView.swift
//  CocktailStar
//
//  Created by Kyrylo Chernov on 27.11.2023.
//

import SwiftUI

struct HomeExpandedHeaderView: View {
    var body: some View {
        HStack {
            Text("Hello, World!")
                .foregroundColor(.white)
            Spacer()
            Text("Show All")
                .foregroundColor(.white)
        }
    }
}

#Preview {
    HomeExpandedHeaderView()
}
