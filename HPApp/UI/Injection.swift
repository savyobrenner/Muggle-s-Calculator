class Injection {
    
    let clientInstance = ClientFactory()
    let coreDataInstance = CoreDataInitializer()
    let housesService: AlamofireHousesService
    let spellsService: AlamofireSpellsService
    let charactersService: AlamofireCharactersService
    let dataManager: DataManager // TODO CRIAR PROTOCOLO COM IMPLEMENTAÇÃO DE ATRIBUTOS
    let webKitService = WebKitService()
    let loading = Loading()
    let alerts = Alerts()
    init() {
        housesService = AlamofireHousesService(client: clientInstance)
        spellsService = AlamofireSpellsService(client: clientInstance)
        charactersService = AlamofireCharactersService(client: clientInstance)
        dataManager = DataManager(context: coreDataInstance.provideContext())
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
