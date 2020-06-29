import Foundation

struct Houses: Codable {
    let id: String
    let name: String
    let mascot: String
    let headOfHouse: String
    let houseGhost: String
    let founder: String
    let v: Int
    let school: String?
    let members: [String]
    let values: [String]
    let colors: [String]
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case name, mascot, headOfHouse, houseGhost, founder
        case v = "__v"
        case school, members, values, colors
    }
}
