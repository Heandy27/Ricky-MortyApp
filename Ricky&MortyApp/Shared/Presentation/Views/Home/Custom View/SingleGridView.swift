//
//  SingleGridView.swift
//  Ricky&MortyApp
//
//  Created by Andy Heredia on 10/3/25.
//

import SwiftUI

struct SingleGridView: View {
    
    var character: Characters
    
    var body: some View {
        VStack(spacing: 15) {
            AsyncImage(url: URL(string: character.image)) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 150)
                
            } placeholder: {
                ProgressView()
                    .frame(width: 150, height: 150)
            }
            VStack {
                Text(character.name)
                    .font(.headline)
                    .bold()
                    .foregroundStyle(.black)
                 
                    .lineLimit(1)
                
                Text("Specie: \(character.species)")
                    .font(.caption)
                    .foregroundStyle(.black)
                    
            }
            
          

        }
        
        .padding()
        .background(Color.white)
      .clipShape(.rect(cornerRadius: 10))
//        .overlay {
//            RoundedRectangle(cornerRadius: 10)
//                .stroke(Color.blue)
//                
//        }
        .shadow(color: .gray.opacity(0.5), radius: 8, x: 0, y: 4)
        
    }
}

#Preview {
    SingleGridView(character: Characters.sampler)
}
