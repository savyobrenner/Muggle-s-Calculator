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
    
    func getRandomHouse(onSuccess: @escaping (String) -> Void, onError: @escaping (DataError) -> Void) {
        client.create(type: String.self, endPoint: "sortingHat}", onSuccess: { (house) in
          onSuccess(house)
        }) { (error) in
            onError(error.self)
        }
      }
      
      func getSpecifHouse(houseID: String, onSuccess: @escaping (Houses) -> Void, onError: @escaping (DataError) -> Void) {
          client.create(type: Houses.self, endPoint: "houses/{\(houseID)}", onSuccess: { (house) in
            onSuccess(house)
          }) { (error) in
              onError(error.self)
          }
      }
    
}
