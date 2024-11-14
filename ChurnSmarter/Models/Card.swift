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
    
    var imageUrlWithPrefix: String {
        return "https://offeroptimist.com" + imageUrl
    }
    
    var referralLink: URL? {
        offers.compactMap { $0.referralUrl }.first.flatMap(URL.init)
    }
    
}
