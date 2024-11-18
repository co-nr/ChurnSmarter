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
    
    func formattedAmount(using cardCurrency: String) -> String {
        amount.map { "\($0.amount.formatted(.number)) \($0.currency?.display ?? cardCurrency.display)" }.joined(separator: " + ")
    }
    
    var formattedSpend: String {
        "Spend $\(spend.formatted(.number)) in \(days) days"
    }
    
}

struct OfferAmount: Decodable, Hashable {
    let amount: Int
    let currency: String?
}
