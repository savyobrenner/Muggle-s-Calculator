import Foundation
public enum DataError {
    case urlNotFound
    case noResponse
    case noData
    case responseStatusCode(code: Int)
    case invalidJSON
    case serverNotAvailable
}
