import Foundation

final class CharactersUseCase: CharactersUseCaseProtocol {
    var repo: CharactersRepositoryProtocol
    private var storeDataProvider: StoreDataProvider
    
    init(repo: CharactersRepositoryProtocol = CharactersRepository(), storeDataProvider: StoreDataProvider = .shared) {
        self.repo = repo
        self.storeDataProvider = storeDataProvider
    }
    
    @MainActor
    func getCharacters() async throws -> [Characters] {
            
        // 1️⃣ Intenta obtener los personajes ya guardados localmente en Core Data
        let localCharacters = storeDataProvider.fetchCharactersWithNonNilId()
        // 2️⃣ Si no hay datos en local, llama a la API y los guarda en Core Data
        if localCharacters.isEmpty {
            // 🔍 Obtiene los personajes desde el repositorio remoto (API)
            let charactersData = try await repo.getCharacters()
            // 💾 Guarda los personajes obtenidos en Core Data
            storeDataProvider.addCharacters(characters: charactersData)
            // 🔄 Recupera de nuevo los personajes ya guardados localmente
            let localCharacters = storeDataProvider.fetchCharactersWithNonNilId()
            // 🔁 Mapea las entidades de Core Data a modelos `Characters` para la vista
            let characters = localCharacters.map {Characters(moCharacter: $0)}
            debugPrint(characters)
            // 🐞 Depura los personajes finales
            return characters
        } else {
            // ✅ Si ya existen personajes guardados, los convierte directamente a modelos `Characters`
            let characters = localCharacters.map {Characters(moCharacter: $0)}
            // 🐞 Depura para saber que se está usando el almacenamiento local
            return characters
        }
    }
    
    
}
