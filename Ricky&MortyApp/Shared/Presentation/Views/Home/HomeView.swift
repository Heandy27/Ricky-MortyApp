//
//  HomeView.swift
//  Ricky&MortyApp
//
//  Created by Andy Heredia on 23/12/24.
//

import SwiftUI

struct HomeView: View {
    
    @State var viewModel: HomeViewModel
    @State var filter: String = ""
    
    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    ForEach(viewModel.filteredCharacters) { characters in
                        NavigationLink {
                            DetailViewHome(character: characters)
                        } label: {
                            SingleViewHome(character: characters)
                        }
                    }
                }
                .searchable(text: $viewModel.searchText, prompt: "Search your character")
                .navigationTitle("Characters")
            }
        }
    }
}

#Preview {
    HomeView(viewModel: HomeViewModel())
}
