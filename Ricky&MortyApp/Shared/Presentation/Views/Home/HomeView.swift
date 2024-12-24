//
//  HomeView.swift
//  Ricky&MortyApp
//
//  Created by Andy Heredia on 23/12/24.
//

import SwiftUI

struct HomeView: View {
    
    @State var viewModel: HomeViewModel
    @State var showModel: Bool = false
    @State var selectedCharacter : Results? = nil
    
    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    ForEach(viewModel.filteredCharacters) { characters in
                        Button {
                            selectedCharacter = characters
                            showModel = true
                        } label: {
                            SingleViewHome(character: characters)
                        }
                    }
                }
                .searchable(text: $viewModel.searchText, prompt: "Search your character")
                .navigationTitle("Characters")
            }
        }
        .sheet(isPresented: $showModel) {
            if let character = selectedCharacter {
                DetailViewHome(character: character)
            }
        }
    }
}

#Preview {
    HomeView(viewModel: HomeViewModel())
}
