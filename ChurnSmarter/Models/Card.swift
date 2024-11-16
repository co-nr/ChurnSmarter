import Foundation

//https://raw.githubusercontent.com/andenacitelli/credit-card-bonuses-api/main/exports/data.json

struct Card: Identifiable, Decodable {
    let id = UUID()
    let name: String
    let issuer: String
    let network: String
    let currency: String
    let countsTowards524: Bool?
    let details: String?
    let isBusiness: Bool
    let annualFee: Int
    let isAnnualFeeWaived: Bool
    let universalCashbackPercent: Double
    let url: String
    let imageUrl: String
    let credits: [Credit]
    let offers: [Offer]
    let historicalOffers: [Offer]
    
    var referralLink: URL? {
        offers.compactMap { $0.referralUrl }.first.flatMap(URL.init)
    }
    
    private enum CodingKeys: CodingKey {
        case name
        case issuer
        case network
        case currency
        case countsTowards524
        case details
        case isBusiness
        case annualFee
        case isAnnualFeeWaived
        case universalCashbackPercent
        case url
        case imageUrl
        case credits
        case offers
        case historicalOffers
    }
}
