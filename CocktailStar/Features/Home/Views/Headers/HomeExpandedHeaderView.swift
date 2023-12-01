//
//  HomeExpandedHeaderView.swift
//  CocktailStar
//
//  Created by Kyrylo Chernov on 27.11.2023.
//

import SwiftUI

struct HomeExpandedHeaderView: View {
    public let title: String?
    
    var body: some View {
        HStack {
            Text(title ?? "")
                .foregroundColor(.white)
            Spacer()
            Text("Show All")
                .foregroundColor(.white)
        }
    }
}

#Preview {
    HomeExpandedHeaderView(title: "Categories")
}
