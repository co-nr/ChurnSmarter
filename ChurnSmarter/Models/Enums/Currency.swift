enum Currency: String, Decodable, CaseIterable {
    // Hotel
    case bestWestern = "BEST_WESTERN"
    case breeze = "BREEZE"
    case hilton = "HILTON"
    case hyatt = "HYATT"
    case ihg = "IHG"
    case marriott = "MARRIOTT"
    case radisson = "RADISSON"
    case wyndham = "WYNDHAM"
    case choice = "CHOICE"
    
    // Airline
    case aeroplan = "AEROPLAN"
    case alaska = "ALASKA"
    case american = "AMERICAN"
    case ana = "ANA"
    case avianca = "AVIANCA"
    case avios = "AVIOS"
    case cathayPacific = "CATHAY_PACIFIC"
    case delta = "DELTA"
    case emirates = "EMIRATES"
    case frontier = "FRONTIER"
    case flyingBlue = "FLYING_BLUE"
    case hawaiian = "HAWAIIAN"
    case jetBlue = "JETBLUE"
    case korean = "KOREAN"
    case latam = "LATAM"
    case lufthansa = "LUFTHANSA"
    case southwest = "SOUTHWEST"
    case spirit = "SPIRIT"
    case united = "UNITED"
    case virgin = "VIRGIN"
    
    // Bank
    case americanExpress = "AMERICAN_EXPRESS"
    case bankOfAmerica = "BANK_OF_AMERICA"
    case barclays = "BARCLAYS"
    case bilt = "BILT"
    case brex = "BREX"
    case chase = "CHASE"
    case citi = "CITI"
    case capitalOne = "CAPITAL_ONE"
    case discover = "DISCOVER"
    case usBank = "US_BANK"
    case wellsFargo = "WELLS_FARGO"
    case penfed = "PENFED"
    
    // Others
    case carnival = "CARNIVAL"
    case amtrak = "AMTRAK"
    case expedia = "EXPEDIA"
    case usd = "USD"
    
    var display: String {
        switch self {
        case .bestWestern: return "Best Western"
        case .breeze: return "Breeze"
        case .hilton: return "Hilton"
        case .hyatt: return "Hyatt"
        case .ihg: return "IHG"
        case .marriott: return "Marriott"
        case .radisson: return "Radisson"
        case .wyndham: return "Wyndham"
        case .choice: return "Choice"
        case .aeroplan: return "Aeroplan"
        case .alaska: return "Alaska"
        case .american: return "American"
        case .ana: return "ANA"
        case .avianca: return "Avianca"
        case .avios: return "Avios"
        case .cathayPacific: return "Cathay Pacific"
        case .delta: return "Delta"
        case .emirates: return "Emirates"
        case .frontier: return "Frontier"
        case .flyingBlue: return "Flying Blue"
        case .hawaiian: return "Hawaiian"
        case .jetBlue: return "JetBlue"
        case .korean: return "Korean"
        case .latam: return "LATAM"
        case .lufthansa: return "Lufthansa"
        case .southwest: return "Southwest"
        case .spirit: return "Spirit"
        case .united: return "United"
        case .virgin: return "Virgin"
        case .americanExpress: return "American Express"
        case .bankOfAmerica: return "Bank of America"
        case .barclays: return "Barclays"
        case .bilt: return "Bilt"
        case .brex: return "Brex"
        case .chase: return "Chase"
        case .citi: return "Citi"
        case .capitalOne: return "Capital One"
        case .discover: return "Discover"
        case .usBank: return "U.S. Bank"
        case .wellsFargo: return "Wells Fargo"
        case .penfed: return "PenFed"
        case .carnival: return "Carnival"
        case .amtrak: return "Amtrak"
        case .expedia: return "Expedia"
        case .usd: return "USD"
        }
    }
    
    var pointValue: Double {
        switch self {
        case .americanExpress: return 1.69
        case .chase: return 1.72
        case .delta: return 1.70
        case .breeze: return 1.00
        case .hilton: return 0.47
        case .marriott: return 0.70
        case .aeroplan: return 1.44
        case .alaska: return 1.69
        case .american: return 1.47
        case .bestWestern: return 0.56
        case .hyatt: return 1.56
        case .ihg: return 0.50
        case .radisson: return 0.50
        case .wyndham: return 0.89
        case .choice: return 0.60
        case .ana: return 1.50
        case .avianca: return 1.20
        case .avios: return 1.09
        case .cathayPacific: return 1.25
        case .emirates: return 1.18
        case .frontier: return 1.05
        case .flyingBlue: return 1.24
        case .hawaiian: return 0.85
        case .jetBlue: return 1.32
        case .korean: return 1.50
        case .latam: return 0.62
        case .lufthansa: return 1.28
        case .southwest: return 1.33
        case .spirit: return 1.10
        case .united: return 1.30
        case .virgin: return 1.40
        case .bankOfAmerica: return 1.00
        case .barclays: return 1.02
        case .bilt: return 1.65
        case .brex: return 1.43
        case .citi: return 1.54
        case .capitalOne: return 1.51
        case .discover: return 1.00
        case .usBank: return 1.00
        case .wellsFargo: return 1.00
        case .penfed: return 0.95
        case .carnival: return 1.00
        case .amtrak: return 2.00
        case .expedia: return 1.00
        case .usd: return 100.00
        }
    }
    var pointValueDisplay: String {
        String(format: "%.2f¢", pointValue)
    }
}
