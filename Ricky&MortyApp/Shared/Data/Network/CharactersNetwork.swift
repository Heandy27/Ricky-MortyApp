import Foundation

protocol CharactersNetworkProtocol {
    func getCharacters() async throws -> [Results]
}


final class CharactersNetwork: CharactersNetworkProtocol {
    
    func getCharacters() async throws -> [Results] {
        
        var characters: [Results] = []
        
        let urlString = "\(ConstantsApp.CONST_API_URL)\(EndPoints.characters.rawValue)"
        
        guard let url = URL(string: urlString) else {
            throw ErrorApp.badUrl
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = HttpMethods.get
        
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            
            guard let res = response as? HTTPURLResponse,
                  res.statusCode == 200 else {
                throw ErrorApp.errorFromApi(statuscode: "Error en el statusCode")
            }
            
            let result = try JSONDecoder().decode(CharactersModel.self, from: data)
            
            characters = result.results
            
        } catch {
            throw ErrorApp.errorParsingData
        }
        
        
        return characters
    }
    
    
}
