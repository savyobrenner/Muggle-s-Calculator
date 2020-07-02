import Foundation

class WebKitService: WebService {

    private let basePath = "http://www.google.com.br/search?q="
    private let endPoint = "&tbm=isch"
    
    func search(name: String?, completion: @escaping (URLRequest) -> Void) {
        let name = (name!).replacingOccurrences(of: " ", with: "+")
        let urlString = basePath + name + endPoint
        let url = URL(string: urlString)!
        let request = URLRequest(url: url)
        completion(request)
    }
           
}
