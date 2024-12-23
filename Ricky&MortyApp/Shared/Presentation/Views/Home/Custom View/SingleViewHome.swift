//
//  SingleViewHome.swift
//  Ricky&MortyApp
//
//  Created by Andy Heredia on 23/12/24.
//

import SwiftUI

struct SingleViewHome: View {
    
    var character: Results
    
    var body: some View {
        HStack {
            AsyncImage(url: URL(string:character.image)) { image in
                image
                    .resizable()
                    .clipShape(Circle())
                    .frame(width: 100, height: 100)
            } placeholder: {
                ProgressView()
                    .frame(width: 150, height: 150)
            }
            Spacer()
            VStack {
                Text(character.name)
                    .font(.title3)
                    .lineLimit(1)
                    .bold()
                HStack {
                    Text(character.gender)
                    Text("-")
                    if character.status == "Alive" {
                        Text(character.status)
                            .foregroundStyle(.green)
                    } else {
                        Text(character.status)
                            .foregroundStyle(.red)
                    }
                }
            }
            Spacer()
          
        }
    }
}

#Preview {
    SingleViewHome(character: Results(id: 1, name: "Rick Sanchez", status: "Alive", species: "Human", type: "", gender: "Male", image: "https://rickandmortyapi.com/api/character/avatar/1.jpeg", episode: ["https://rickandmortyapi.com/api/episode/1", "https://rickandmortyapi.com/api/episode/2"]))
}