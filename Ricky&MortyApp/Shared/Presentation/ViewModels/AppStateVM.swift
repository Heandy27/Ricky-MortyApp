import Foundation


@Observable
final class AppStateVM {
    // Publicados
    var status: StatusModel = .loading
    // No publicados
    @ObservationIgnored
    var useCase: CharactersUseCaseProtocol
    
    init(useCase: CharactersUseCaseProtocol = CharactersUseCase()) {
        self.useCase = useCase
        statusApp()
    }
    
    @MainActor
    func getCharacters() {
        self.status = .loading
        
        Task {
            do {
                let characters = try await useCase.getCharacters()
                
                if characters.isEmpty {
                    self.status = .errorApp
                } else {
                    self.status = .success
                }
            } catch {
                self.status = .errorApp
            }
        }
    }
    
    func statusApp() {
        DispatchQueue.global().asyncAfter(deadline: .now() + 2) {
            DispatchQueue.main.async {
                self.getCharacters()
            }
        }
    }
    
}
