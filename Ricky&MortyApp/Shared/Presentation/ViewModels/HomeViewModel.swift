import Foundation
@Observable
final class HomeViewModel {
    // Publicadas
    var characters: [Results] = []
    var searchText: String = ""
    var showModel: Bool = false
    var characterselected: Results?
    // No publicadas
    @ObservationIgnored
    let characterUsecase: CharactersUseCaseProtocol
    
    init(characterUsecase: CharactersUseCaseProtocol = CharactersUseCase()) {
        self.characterUsecase = characterUsecase
        
        Task {
            try await getCharacters()
        }
    }
    
    var filteredCharacters: [Results] {
        if searchText.isEmpty {
            return characters
        } else {
            return characters.filter { results in
                results.name.localizedCaseInsensitiveContains(searchText)
            }
        }
    }
    
    
    @MainActor
    func getCharacters() async throws {
        let data = try await characterUsecase.getCharacters()
        characters = data
    }
}
