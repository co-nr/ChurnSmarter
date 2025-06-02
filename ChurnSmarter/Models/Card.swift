//https://raw.githubusercontent.com/andenacitelli/credit-card-bonuses-api/main/exports/data.json

struct Card: Identifiable, Decodable, Hashable {
    let cardId: String
    let name: String
    let issuer: Issuer
    let network: Network
    let currency: Currency
    let isBusiness: Bool
    let annualFee: Double
    let isAnnualFeeWaived: Bool
    let universalCashbackPercent: Double
    let url: String
    let imageUrl: String
    let credits: [Credit]
    let offers: [Offer]
    let historicalOffers: [Offer]
    let discontinued: Bool
    
    var id: String { cardId }
    
    var referralLink: String? { offers.compactMap { $0.referralUrl }.first }
}

extension Card {
    var bestOffer: (offer: Offer, value: Double)? {
        offers
            .map { offer in
                let value = offer.value(defaultCurrency: currency, annualFee: annualFee)
                return (offer, value)
            }
            .max(by: { $0.value < $1.value })
    }
    var historicalMax: Double {
            guard
                let best = bestOffer?.value,
                let maxHistorical = historicalOffers
                    .map({ $0.value(defaultCurrency: currency, annualFee: annualFee) })
                    .max(), maxHistorical > 0
            else {
                return 0
            }
            
            return min(100, (best / maxHistorical) * 100)
        }
}
