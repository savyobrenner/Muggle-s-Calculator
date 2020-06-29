import Foundation
import Alamofire


enum HttpCodes: Int {
    case success = 200
    case routeNotFound = 404
    case serveError = 500
}

class ClientFactory {
    
    private let key = "$2a$10$bLTsVo/XvQukFDOan1xAVOjkMonkJBk3z9n0NJqHBzjt1ggl87rSO"
    private let basePath = "https://www.potterapi.com/v1/"
    
    
    func create<ResponseType: Codable>(type: ResponseType.Type,endPoint: String, onSuccess: @escaping (ResponseType) -> Void, onError: @escaping (DataError) -> Void) {
        
        let custom_url = (basePath+endPoint+"?key="+key)
        AF.request(custom_url).responseJSON { (response) in
            guard let urlResponse = response.response else {
                onError(.noData)
                return
            }
            if urlResponse.statusCode == HttpCodes.success.rawValue {
                let hpData = response.value ?? ""
                do {
                    let hpData = try JSONDecoder().decode(ResponseType.self, from: hpData as! Data)
                    onSuccess(hpData)
                }catch{
                    print(error.localizedDescription)
                    onError(.invalidJSON)
                }
            } else if urlResponse.statusCode == HttpCodes.routeNotFound.rawValue {
                onError(.urlNotFound)
                return
            } else if urlResponse.statusCode == HttpCodes.serveError.rawValue {
                onError(.serverNotAvailable)
                return
            }
        }
    }
}
