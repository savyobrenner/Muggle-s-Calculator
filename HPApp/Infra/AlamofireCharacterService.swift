import Foundation

class AlamofireCharactersService: CharacterService {
    

    let client: ClientFactory
    
    init(client: ClientFactory) {
        self.client = client
    }
    
    func getAllCharacters(onSuccess: @escaping ([Characters]) -> Void, onError: @escaping (DataError) -> Void) {
        client.create(type: [Characters].self, endPoint: "characters", onSuccess: { (characters) in
          onSuccess(characters)
        }) { (error) in
            onError(error.self)
        }
    }
    
    func getSpecifCharacter(characterID: String, onSuccess: @escaping ([Characters]) -> Void, onError: @escaping (DataError) -> Void) {
        client.create(type: [Characters].self, endPoint: "characters/{\(characterID)}", onSuccess: { (characters) in
          onSuccess(characters)
        }) { (error) in
            onError(error.self)
        }
    }
    


}
