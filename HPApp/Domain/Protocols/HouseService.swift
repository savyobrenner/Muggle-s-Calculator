protocol HouseService {
    
    func getRandomHouse(onSuccess: @escaping (String) -> Void, onError: @escaping (DataError) -> Void)
    
    func getAllHouses(onSuccess: @escaping ([Houses]) -> Void, onError: @escaping (DataError) -> Void)
    
    func getSpecifHouse(houseID: String,onSuccess: @escaping (Houses) -> Void, onError: @escaping (DataError) -> Void)
}
