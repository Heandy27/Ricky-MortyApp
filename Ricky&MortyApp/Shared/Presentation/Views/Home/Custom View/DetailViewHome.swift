//
//  DetailViewHome.swift
//  Ricky&MortyApp
//
//  Created by Andy Heredia on 23/12/24.
//

import SwiftUI

struct DetailViewHome: View {
    
    var character: Results
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string:character.image)) { image in
                image
                    .resizable()
                    .frame(height: 400)
            } placeholder: {
                ProgressView()
                    .frame(width: 150, height: 150)
            }
            Text(character.name)
            Text(character.status)
            Spacer()
        }
    }
}

#Preview {
    DetailViewHome(character: Results(id: 1, name: "Rick Sanchez", status: "Alive", species: "Human", type: "", gender: "Male", image: "https://rickandmortyapi.com/api/character/avatar/1.jpeg", episode: ["https://rickandmortyapi.com/api/episode/1", "https://rickandmortyapi.com/api/episode/2"]))
}
