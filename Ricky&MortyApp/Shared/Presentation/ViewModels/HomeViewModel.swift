import Foundation
@Observable
final class HomeViewModel {
    // Publicadas
    var characters: [Characters] = []
    var searchText: String = ""
    var showModel: Bool = false
    var characterselected: Characters?
    // No publicadas
    @ObservationIgnored
    let characterUsecase: CharactersUseCaseProtocol
    
    init(characterUsecase: CharactersUseCaseProtocol = CharactersUseCase()) {
        self.characterUsecase = characterUsecase
        
        Task {
            do {
                try await getCharacters()
            } catch {
                debugPrint("Error loading characters: \(error.localizedDescription)")
            }
        }
    }
    
    var filteredCharacters: [Characters] {
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
