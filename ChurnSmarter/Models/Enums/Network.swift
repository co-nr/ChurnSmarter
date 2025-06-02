enum Network: String, Decodable, CaseIterable {
    case visa = "VISA"
    case mastercard = "MASTERCARD"
    case americanExpress = "AMERICAN_EXPRESS"
    case discover = "DISCOVER"

    var display: String {
        switch self {
        case .visa: return "Visa"
        case .mastercard: return "Mastercard"
        case .americanExpress: return "American Express"
        case .discover: return "Discover"
        }
    }
}
