import Foundation

struct Spells: Codable {
    let id: String
    let spell: String
    let type: String
    let effect: String
    let v: Int?
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case spell, type, effect
        case v = "__v"
    }
}
