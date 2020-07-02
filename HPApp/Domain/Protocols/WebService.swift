import Foundation

protocol WebService {
    func search(name: String?, completion: @escaping (URLRequest)->Void)
}
