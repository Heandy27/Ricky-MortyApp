import CoreData

/// Clase que gestiona el acceso y almacenamiento de datos usando Core Data
class StoreDataProvider {
    
    static var shared: StoreDataProvider = .init()
    
    /// Contenedor persistente de Core Data, donde se gestiona el modelo de datos
    private let persistentContainer: NSPersistentContainer
    /// Contexto que se utiliza para realizar operaciones (crear, leer, actualizar, borrar) sobre las entidades
    private var context: NSManagedObjectContext {
        let viewContext = persistentContainer.viewContext
        viewContext.mergePolicy = NSMergePolicy.mergeByPropertyStoreTrump
        return viewContext
    }
    
    /// Inicializa el contenedor persistente con el nombre del modelo y carga los stores
    init() {
        // 🚨 Evita inicializar el store real cuando estás en Previews de SwiftUI
        #if DEBUG
        if ProcessInfo.processInfo.environment["XCODE_RUNNING_FOR_PREVIEWS"] == "1" {
            // En Preview → no inicialices nada de Core Data
            self.persistentContainer = NSPersistentContainer(name: "Model")
            return
        }
        #endif
        // Inicializa el contenedor con el nombre del modelo .xcdatamodeld
        self.persistentContainer = NSPersistentContainer(name: "Model")
        // Carga los stores (archivos SQLite o en memoria)
        self.persistentContainer.loadPersistentStores { _, error in
            if let error {
                fatalError("Error loading BBDD \(error.localizedDescription)")
            }
        }
    }
    
    /// Método que guarda los cambios que existan en el contexto de Core Data
    func save() {
        // ✅ Evita llamar a save() si no hay stores cargados (previene crash en Previews o errores)
        if persistentContainer.persistentStoreCoordinator.persistentStores.isEmpty {
                debugPrint("No persistent store loaded, skipping save.")
                return
            }
        // Verifica si hay cambios pendientes de guardar
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                debugPrint("Error saving context \(error.localizedDescription)")
            }
        }
    }
    
}




extension StoreDataProvider {
    
    /// Guarda una lista de personajes (`Results`) obtenidos de la API en Core Data
    /// - Parameter characters: Array de personajes desde la API
    
    func addCharacters(characters: [Characters]) {
        // Itera por cada personaje recibido
        for character in characters {
//            // Busca si ya existe un personaje con este id
//            let fetchRequest: NSFetchRequest<MOCharacter> = MOCharacter.fetchRequest()
//            fetchRequest.predicate = NSPredicate(format: "id == %d", character.id)
            
            // Crea una nueva entidad MOCharacter en Core Data
            let newCharacter = MOCharacter(context: context)
            // Asigna los valores básicos al personaje
            newCharacter.id = Int16(character.id)
            newCharacter.name = character.name
            newCharacter.status = character.status
            newCharacter.species = character.species
            newCharacter.type = character.type
            newCharacter.gender = character.gender
            newCharacter.image = character.image
            // Convierte el array de episodios en un objeto transformable
            newCharacter.episode = character.episode as NSArray
            
            newCharacter.origin = createOrigin(from: character.origin, for: newCharacter)
            newCharacter.location = createLocation(from: character.location, for: newCharacter)
        }
        save()
    }
    
    
    private func createOrigin(from originData: Origin, for character: MOCharacter) -> MOOrigin {
        let origin = MOOrigin(context: context)
        origin.name = originData.name
        origin.url = originData.url
        origin.character = character
       
        
        return origin
    }
    
    private func createLocation(from locationData: Location, for character: MOCharacter) -> MOLocation {
        let location = MOLocation(context: context)
        location.name = locationData.name
        location.url = locationData.url
        location.character = character
        return location
    }
    
    func fetchCharactersWithNonNilId() -> [MOCharacter] {
        let request = MOCharacter.fetchRequest()
        // Aplica el filtro si se proporcionó
        // Filtra solo los que tienen id diferente de nil (opcional, por seguridad)
        let predicate = NSPredicate(format: "id != nil")
        request.predicate = predicate
        
        let sortDescriptor = NSSortDescriptor(keyPath: \MOCharacter.name, ascending: true)
        request.sortDescriptors = [sortDescriptor]
        
        do {
            return try context.fetch(request)
        } catch {
            debugPrint("Error loading characters \(error.localizedDescription)")
            return []
        }
        
        
        // Para revisar cuantos personajes hay
        // try? context.count(for: request)
    }
    
    
}
