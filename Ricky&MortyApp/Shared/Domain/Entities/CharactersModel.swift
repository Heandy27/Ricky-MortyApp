import Foundation

struct CharactersModel: Codable {
    let results: [Results]
}

struct Results: Codable, Identifiable {
    let id: Int
    let name: String
    let status: String
    let species: String
    let type: String
    let gender: String
    let image: String
    let episode: [String]
}
