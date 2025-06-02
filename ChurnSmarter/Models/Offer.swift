struct Offer: Decodable, Hashable {
    let spend: Double
    let amount: [OfferAmount]
    let days: Int
    let credits: [Credit]
    let details: String?
    let expiration: String?
    let url: String?
    let referralUrl: String?
}

struct OfferAmount: Decodable, Hashable {
    let amount: Double
    let currency: Currency?
}


extension Offer {
    func formattedAmount(defaultCurrency: Currency) -> String {
        amount.map { offerAmount in
            let currency = offerAmount.currency ?? defaultCurrency
            let formatted = offerAmount.amount.formatted(.number)
            return currency == .usd ? "$\(formatted)" : "\(formatted) \(currency.display)"
        }
        .joined(separator: " + ")
    }
    
    var formattedSpend: String {
        "Spend $\(spend.formatted(.number)) in \(days) days"
    }
    
    func value(defaultCurrency: Currency, annualFee: Double) -> Double {
        let totalValue = amount.reduce(0.0) { sum, offerAmount in
            let currency = offerAmount.currency ?? defaultCurrency
            return sum + (offerAmount.amount * currency.pointValue)
        }
        return max(0, (totalValue / 100) - annualFee)
    }
    
    func pointBreakdown(currency: Currency) -> String {
        let totalPoints = Int(amount.reduce(0) { $0 + $1.amount })
        let centsPerPoint = currency.pointValue
        return "\(totalPoints.formatted()) points @ \(String(format: "%.2f", centsPerPoint))¢"
    }
}
