import Foundation

struct Offer: Decodable, Hashable {
    let spend: Double
    let amount: [OfferAmount]
    let days: Int
    let expiration: String?
    let credits: [Credit]
    let details: String?
    let url: String?
    let referralUrl: String?
    
    var highestAmount: Int {
        amount.compactMap { $0.amount }.max() ?? 0
    }
}

struct OfferAmount: Decodable, Hashable {
    let amount: Int
    let currency: String?
}
