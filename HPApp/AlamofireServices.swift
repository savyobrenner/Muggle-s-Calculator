import Foundation
import Alamofire

class AlamofireServices {
    
    
    func getRandomHouse(onSuccess: @escaping (String) -> Void, onError: @escaping (DataError) -> Void){
        let endPoint = "sortingHat"
        let custom_url = basePath+endPoint
        AF.request(custom_url).responseJSON { (response) in
            guard let urlResponse = response.response else {
                onError(.noData)
                return
            }
            if urlResponse.statusCode == 200 {
                    let hpData = response.value
                    onSuccess(hpData as! String)
            }
        }
    }
    
    func getAllCharacters(onSuccess: @escaping ([Characters]) -> Void, onError: @escaping (DataError) -> Void){
        let endPoint = "characters"
        let custom_url = basePath+endPoint+"?key="+key
        AF.request(custom_url).responseJSON { (response) in
            guard let urlResponse = response.response else {
                onError(.noData)
                return
            }
            if urlResponse.statusCode == 200 {
                guard let data = response.data else {
                    onError(.responseStatusCode(code: urlResponse.statusCode))
                    return
                }
                do {
                    let hpData = try JSONDecoder().decode([Characters].self, from: data)
                    onSuccess(hpData)
                }catch{
                    print(error.localizedDescription)
                    onError(.invalidJSON)
                }
            }
        }
    }
    
    func getEspecifCharacter(characterID: String, onSuccess: @escaping ([Characters]) -> Void, onError: @escaping (DataError) -> Void){
        let endPoint = "characters"
        let custom_url = basePath+endPoint+characterID+"?key="+key
        AF.request(custom_url).responseJSON { (response) in
            guard let urlResponse = response.response else {
                onError(.noData)
                return
            }
            if urlResponse.statusCode == 200 {
                guard let data = response.data else {
                    onError(.responseStatusCode(code: urlResponse.statusCode))
                    return
                }
                do {
                    let hpData = try JSONDecoder().decode([Characters].self, from: data)
                    onSuccess(hpData)
                }catch{
                    print(error.localizedDescription)
                    onError(.invalidJSON)
                }
            }
        }
    }
    
    func getAllHouses(onSuccess: @escaping ([Houses]) -> Void, onError: @escaping (DataError) -> Void){
        let endPoint = "houses"
        let custom_url = basePath+endPoint+"?key="+key
        AF.request(custom_url).responseJSON { (response) in
            guard let urlResponse = response.response else {
                onError(.noData)
                return
            }
            if urlResponse.statusCode == 200 {
                guard let data = response.data else {
                    onError(.responseStatusCode(code: urlResponse.statusCode))
                    return
                }
                do {
                    let hpData = try JSONDecoder().decode([Houses].self, from: data)
                    onSuccess(hpData)
                }catch{
                    print(error.localizedDescription)
                    onError(.invalidJSON)
                }
            }
        }
    }
    
    func getEspecifHouse(houseID: String,onSuccess: @escaping ([Houses]) -> Void, onError: @escaping (DataError) -> Void){
        let endPoint = "houses"
        let custom_url = basePath+endPoint+houseID+"?key="+key
        AF.request(custom_url).responseJSON { (response) in
            guard let urlResponse = response.response else {
                onError(.noData)
                return
            }
            if urlResponse.statusCode == 200 {
                guard let data = response.data else {
                    onError(.responseStatusCode(code: urlResponse.statusCode))
                    return
                }
                do {
                    let hpData = try JSONDecoder().decode([Houses].self, from: data)
                    onSuccess(hpData)
                }catch{
                    print(error.localizedDescription)
                    onError(.invalidJSON)
                }
            }
        }
    }
    
    func getAllSpells(onSuccess: @escaping ([Spells]) -> Void, onError: @escaping (DataError) -> Void){
        let endPoint = "spells"
        let custom_url = basePath+endPoint+"?key="+key
        AF.request(custom_url).responseJSON { (response) in
            guard let urlResponse = response.response else {
                onError(.noData)
                return
            }
            if urlResponse.statusCode == 200 {
                guard let data = response.data else {
                    onError(.responseStatusCode(code: urlResponse.statusCode))
                    return
                }
                do {
                    let hpData = try JSONDecoder().decode([Spells].self, from: data)
                    onSuccess(hpData)
                }catch{
                    print(error.localizedDescription)
                    onError(.invalidJSON)
                }
            }
        }
    }
}
