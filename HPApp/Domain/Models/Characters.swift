import Foundation

struct Characters: Codable {
    let id: String
    let name: String
    let role: String?
    let house: House?
    let school: School?
    let v: Int
    let ministryOfMagic: Bool
    let orderOfThePhoenix: Bool
    let dumbledoresArmy: Bool
    let deathEater: Bool
    let bloodStatus: BloodStatus
    let species: String
    let boggart: String?
    let alias: String?
    let animagus: String?
    let wand: String?
    let patronus: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case name, role, house, school
        case v = "__v"
        case ministryOfMagic, orderOfThePhoenix, dumbledoresArmy, deathEater, bloodStatus, species, boggart, alias, animagus, wand, patronus
    }
}
enum BloodStatus: String, Codable {
    case halfBlood = "half-blood"
    case halfGiant = "half-giant"
    case muggle = "muggle"
    case muggleBorn = "muggle-born"
    case pureBlood = "pure-blood"
    case quarterVilla = "quarter-villa"
    case squib = "squib"
    case unknown = "unknown"
}

enum House: String, Codable {
    case gryffindor = "Gryffindor"
    case hufflepuff = "Hufflepuff"
    case ravenclaw = "Ravenclaw"
    case slytherin = "Slytherin"
}

enum School: String, Codable {
    case beauxbatonsAcademyOfMagic = "Beauxbatons Academy of Magic"
    case durmstrangInstitute = "Durmstrang Institute"
    case hogwartsAcademyOfWitchcraftAndWizardry = "Hogwarts Academy of Witchcraft and Wizardry"
    case hogwartsSchoolOfWitchcraftAndWizardry = "Hogwarts School of Witchcraft and Wizardry"
}

