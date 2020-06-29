protocol SpellsService {
    func getAllSpells(onSuccess: @escaping ([Spells]) -> Void, onError: @escaping (DataError) -> Void)
}
