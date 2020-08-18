protocol HouseService {
        
    func getAllHouses(onSuccess: @escaping ([Houses]) -> Void, onError: @escaping (DataError) -> Void)
    
}
