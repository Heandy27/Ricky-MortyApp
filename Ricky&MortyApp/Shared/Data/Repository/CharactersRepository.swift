import Foundation

final class CharactersRepository: CharactersRepositoryProtocol {
    
    var network: CharactersNetworkProtocol
    
    init(network: CharactersNetworkProtocol = CharactersNetwork()) {
        self.network = network
    }
    
    func getCharacters() async throws -> [Characters] {
        return try await network.getCharacters()
    }
    
    
}
