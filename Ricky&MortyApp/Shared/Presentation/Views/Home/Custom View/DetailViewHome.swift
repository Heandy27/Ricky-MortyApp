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
          
                VStack {
                    Text(character.name)
                        .font(.largeTitle)
                        .bold()
                        .foregroundStyle(.white)
                        .padding()
                        .lineLimit(1)
                    
                    Text("Specie: \(character.species)")
                        .font(.footnote).bold()
                        .foregroundStyle(.white)
                        .padding(.bottom, 10)
                    Text("Origin: \(character.origin.name)")
                        .font(.footnote).bold()
                        .foregroundStyle(.white)
                        .padding(.bottom, 10)
                    Text("Location: \(character.location.name)")
                        .font(.footnote).bold()
                        .foregroundStyle(.white)
                        .padding(.bottom, 10)
//                    HStack {
//                        ForEach(character.episode, id: \.self) { episode in
//                            if let lastComponent = episode.split(separator: "/").last {
//                                Text("Episode:")
//                                    .foregroundStyle(.white)
//                                    .bold()
//                                Text("\(String(lastComponent))")
//                                    .foregroundStyle(.white)
//                            }
//                        }
//                    }
                }
                .padding()
                .background(Color(red: 63/255, green: 67/255, blue: 84/255).opacity(0.8).frame(width: 350, height: 350))
                .offset(y: 0)
                Spacer()
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(red: 42/255, green: 42/255, blue: 69/255))
        .ignoresSafeArea()
    }
    
}

#Preview {
    DetailViewHome(character: Results(id: 1, name: "Rick Sanchez", status: "Alive", species: "Human", type: "", gender: "Male", origin: Origin(name: "Earth (C-137)", url: "https://rickandmortyapi.com/api/location/3"), location: Location(name: "Citadel of Ricks", url: ""), image: "https://rickandmortyapi.com/api/character/avatar/1.jpeg", episode: ["https://rickandmortyapi.com/api/episode/1", "https://rickandmortyapi.com/api/episode/2"]))
}
