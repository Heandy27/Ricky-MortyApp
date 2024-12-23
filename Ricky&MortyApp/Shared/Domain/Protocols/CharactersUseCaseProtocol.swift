import Foundation

protocol CharactersUseCaseProtocol {
    var repo: CharactersRepositoryProtocol { get set }
    func getCharacters() async throws -> [Results]
}

