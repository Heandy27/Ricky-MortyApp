import Foundation

final class CharactersUseCase: CharactersUseCaseProtocol {
    var repo: CharactersRepositoryProtocol
    
    init(repo: CharactersRepositoryProtocol = CharactersRepository()) {
        self.repo = repo
    }
    
    func getCharacters() async throws -> [Results] {
        return try await repo.getCharacters()
    }
    
    
}
