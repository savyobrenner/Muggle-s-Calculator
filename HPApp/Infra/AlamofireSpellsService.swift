import Foundation

class AlamofireSpellsService: SpellsService {
    
    let client: ClientFactory
    
    init(client: ClientFactory) {
        self.client = client
    }
    
    func getAllSpells(onSuccess: @escaping ([Spells]) -> Void, onError: @escaping (DataError) -> Void) {
        client.create(type: [Spells].self, endPoint: "spells", onSuccess: { (spells) in
          onSuccess(spells)
        }) { (error) in
            onError(error.self)
        }
    }
    
}
