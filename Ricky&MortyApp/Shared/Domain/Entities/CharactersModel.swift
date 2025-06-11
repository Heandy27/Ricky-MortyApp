import Foundation

struct CharactersModel: Codable {
    let results: [Characters]
}

struct Characters: Codable, Identifiable {

    
    let id: Int
    let name: String
    let status: String
    let species: String
    let type: String
    let gender: String
    let origin: Origin
    let location: Location
    let image: String
    let episode: [String]
    
    
  
    
    init(moCharacter: MOCharacter) {
        self.id = Int(moCharacter.id)
        self.name = moCharacter.name ?? ""
        self.status = moCharacter.status ?? ""
        self.species = moCharacter.species ?? ""
        self.type = moCharacter.type ?? ""
        self.gender = moCharacter.gender ?? ""
        
        
        //Usa los inicializadores de tus structs
        self.origin = Origin(moOrigin: moCharacter.origin)
        self.location = Location(moLocation: moCharacter.location)
        
        self.image = moCharacter.image ?? ""
        
        // episode: lo conviertes de NSObject (o NSArray) a [String]
        if let episodeArray = moCharacter.episode as? [String] {
            self.episode = episodeArray
        } else {
            self.episode = []
        }
    }
    
    init() {
        self.id = 0
        self.name = "Rick Sanchez"
        self.status = "Alive"
        self.species = "Human"
        self.type = ""
        self.gender = "Male"
        self.origin = Origin()
        self.location = Location()
        self.image = "https://rickandmortyapi.com/api/character/avatar/1.jpeg"
        self.episode = []
    }
    
    static let sampler = Characters()
    
}

struct Origin: Codable {
    let name: String
    let url: String
    
    init(moOrigin: MOOrigin?) {
        // Si moOrigin es nil, usamos valores vacíos
        self.name = moOrigin?.name ?? ""
        self.url = moOrigin?.url ?? ""
    }
    
    init() {
        self.name = "Earth (C-137)"
        self.url = ""
    }
    
}

struct Location: Codable {
    let name: String
    let url: String
    
    init(moLocation: MOLocation?) {
        self.name = moLocation?.name ?? ""
        self.url = moLocation?.url ?? ""
    }
    
    init() {
        self.name = "Citadel of Ricks"
        self.url = ""
    }
}
