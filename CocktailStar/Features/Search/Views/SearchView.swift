//
//  SearchView.swift
//  CocktailStar
//
//  Created by Kyrylo Chernov on 01.12.2023.
//

import SwiftUI
import NavigationTransitions
import Combine

struct SearchView: View {
    @StateObject public var viewModel: SearchViewModel
    @FocusState private var focused: Bool
    
    var body: some View {
        VStack {
            SearchBarView(searchText: $viewModel.searchText)
                .focused($focused)
            List(viewModel.sections, id: \.id) { section in
                Section {
                    ForEach(section.items, id: \.id) { item in
                        SearchCell(viewModel: item)
                            .listRowBackground(Color.mainBackground)
                            .onTapGesture {
                                viewModel.searchDidTap(searchText: item.text)
                            }
                    }
                    if viewModel.sections.first?.type.title == section.type.title {
                        Divider()
                            .background(.white)
                            .listRowBackground(Color.mainBackground)
                    }
                }
            header: {
                Text(section.type.title)
                    .fontWeight(.bold)
                    .font(.headline)
            }
            .foregroundStyle(.white)
            }
            .scrollContentBackground(.hidden)
            .listSectionSpacing(0)
            .listStyle(.grouped)
        }
        
        .padding(.horizontal, 16)
        .background(.mainBackground)
        .onAppear(perform: {
            focused = true
        })
    }
}

#Preview {
    SearchView(viewModel: SearchViewModel())
}
