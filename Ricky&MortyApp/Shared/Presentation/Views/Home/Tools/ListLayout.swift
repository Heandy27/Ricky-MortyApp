//
//  ListLayout.swift
//  Ricky&MortyApp
//
//  Created by Andy Heredia on 10/3/25.
//

import SwiftUI

struct ListLayout: View {
    
    @State var viewModel: HomeViewModel
 //   @State var selectedCharacter: Results?
    
    var body: some View {
        List {
            ForEach(viewModel.filteredCharacters) { characters in
                Button {
                    viewModel.characterselected = characters
                    viewModel.showModel = true
                } label: {
                    SingleViewHome(character: characters)
                }
            }
        }
        .searchable(text: $viewModel.searchText, prompt: "Search your character")
        .navigationTitle("Characters")
    }
}

#Preview {
    ListLayout(viewModel: HomeViewModel())
}
