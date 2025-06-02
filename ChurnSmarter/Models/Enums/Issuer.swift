enum Issuer: String, Decodable, CaseIterable {
    case americanExpress = "AMERICAN_EXPRESS"
    case bankOfAmerica = "BANK_OF_AMERICA"
    case barclays = "BARCLAYS"
    case brex = "BREX"
    case chase = "CHASE"
    case capitalOne = "CAPITAL_ONE"
    case citi = "CITI"
    case discover = "DISCOVER"
    case first = "FIRST"
    case fnbo = "FNBO"
    case penfed = "PENFED"
    case pnc = "PNC"
    case synchrony = "SYNCHRONY"
    case usBank = "US_BANK"
    case webBank = "WEB_BANK"
    case wellsFargo = "WELLS_FARGO"

    var display: String {
        switch self {
        case .americanExpress: return "American Express"
        case .bankOfAmerica: return "Bank of America"
        case .barclays: return "Barclays"
        case .brex: return "Brex"
        case .chase: return "Chase"
        case .capitalOne: return "Capital One"
        case .citi: return "Citi"
        case .discover: return "Discover"
        case .first: return "First"
        case .fnbo: return "FNBO"
        case .penfed: return "PenFed"
        case .pnc: return "PNC"
        case .synchrony: return "Synchrony"
        case .usBank: return "U.S. Bank"
        case .webBank: return "WebBank"
        case .wellsFargo: return "Wells Fargo"
        }
    }
}
