class Injection {
    
    let clientInstance = ClientFactory()
    let housesService: AlamofireHousesService
    let spellsService: AlamofireSpellsService
    let charactersService: AlamofireCharactersService
    let webKitService = WebKitService()
    let loading = Loading()
    
    init() {
        housesService = AlamofireHousesService(client: clientInstance)
        spellsService = AlamofireSpellsService(client: clientInstance)
        charactersService = AlamofireCharactersService(client: clientInstance)
    }
    
    func expressionResolver(type: ExpressionType) -> Expression{
        switch type {
        case .sum:
        return Sum()
        case .subtraction:
        return Subtraction()
        case .divide:
        return Divide()
        case .multiplication:
        return Multiplication()
        }
    }
}

enum ExpressionType {
    case sum
    case subtraction
    case multiplication
    case divide
}
