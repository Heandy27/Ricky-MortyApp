import Foundation

protocol CharactersRepositoryProtocol {
    func getCharacters() async throws -> [Results]
}
