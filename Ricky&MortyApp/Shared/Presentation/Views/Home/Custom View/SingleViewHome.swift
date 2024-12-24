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
                    .foregroundStyle(.black)
                HStack {
                    Text(character.gender)
                        .foregroundStyle(.black)
                    Text("-")
                    if character.status == "Alive" {
                        Text(character.status)
                            .foregroundStyle(.green)
                    } else if character.status == "unknown"{
                        Text(character.status)
                            .foregroundStyle(.black)
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
    SingleViewHome(character: Results(id: 1, name: "Rick Sanchez", status: "Alive", species: "Human", type: "", gender: "Male", origin: Origin(name: "Earth (C-137)", url: "https://rickandmortyapi.com/api/location/3"), location: Location(name: "Citadel of Ricks", url: ""), image: "https://rickandmortyapi.com/api/character/avatar/1.jpeg", episode: ["https://rickandmortyapi.com/api/episode/1", "https://rickandmortyapi.com/api/episode/2"]))
}
