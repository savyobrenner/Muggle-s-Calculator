protocol CharacterService {
    func getAllCharacters(onSuccess: @escaping ([Characters]) -> Void, onError: @escaping (DataError) -> Void)
    func getSpecifCharacter(characterID: String, onSuccess: @escaping ([Characters]) -> Void, onError: @escaping (DataError) -> Void)
}
