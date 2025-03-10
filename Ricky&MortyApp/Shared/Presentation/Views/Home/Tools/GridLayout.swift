//
//  GridLayout.swift
//  Ricky&MortyApp
//
//  Created by Andy Heredia on 10/3/25.
//

import SwiftUI

struct GridLayout: View {
    
    @State var viewModel: HomeViewModel
   // @Binding var selectedCharacter: Results?
    
    var columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach(viewModel.filteredCharacters) { character in
                    Button {
                        viewModel.characterselected = character
                        viewModel.showModel = true
                    } label: {
                        SingleGridView(character: character)
                    }
                }
            }
            
        }
        .searchable(text: $viewModel.searchText, prompt: "Search your character")
        .navigationTitle("Characters")
    }
}

#Preview {
    GridLayout(viewModel: HomeViewModel())
}
