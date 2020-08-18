import Foundation

class AlamofireHousesService: HouseService {

    let client: ClientFactory
    
    init(client: ClientFactory) {
        self.client = client
    }
    
    func getAllHouses(onSuccess: @escaping ([Houses]) -> Void, onError: @escaping (DataError) -> Void) {
        client.create(type: [Houses].self, endPoint: "houses", onSuccess: { (houses) in
          onSuccess(houses)
        }) { (error) in
            onError(error.self)
        }
    }
    
    
}
