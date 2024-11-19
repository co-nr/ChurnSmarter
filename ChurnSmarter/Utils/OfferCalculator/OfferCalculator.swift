import Foundation

final class OfferCalculator {
    
    private let card: Card
    
    init(card: Card) {
        self.card = card
    }
    
    func pointValue(for currency: String) -> Double {
        return pointValues[currency] ?? 0.01
    }
    
    func offerValue(for offer: Offer) -> Double {
        let totalValue = offer.amount.reduce(0.0) { result, offerAmount in
            let pointValue = pointValue(for: offerAmount.currency ?? card.currency)
            return result + (Double(offerAmount.amount) * pointValue)
        }
        
        let netValue = totalValue - Double(card.annualFee)
        return max(netValue, 0)
    }
    
    func highestOffer() -> Offer? {
        card.offers.max { offerValue(for: $0) < offerValue(for: $1) }
    }
    
    func highestOfferValue() -> Double {
        guard let highestOffer = highestOffer() else {
            return 0
        }
        return offerValue(for: highestOffer)
    }
    
    func highestGrossOfferValue() -> Double {
        card.offers.map { grossOfferValue(for: $0) }.max() ?? 0
    }
    
    func grossOfferValue(for offer: Offer) -> Double {
        offer.amount.reduce(0.0) { result, offerAmount in
            let pointValue = pointValue(for: offerAmount.currency ?? card.currency)
            return result + (Double(offerAmount.amount) * pointValue)
        }
    }
    
    func percentageOfHistoricalMax() -> Double {
        let highestHistoricalValue = card.historicalOffers
            .map { offerValue(for: $0) }
            .max() ?? 0
        
        guard highestHistoricalValue > 0 else { return 0 }
        
        let highestCurrentValue = card.offers
            .map { offerValue(for: $0) }
            .max() ?? 0
        
        return (highestCurrentValue / highestHistoricalValue) * 100
    }
    
    func formattedDescriptions(for offer: Offer) -> [String] {
        offer.amount.map { offerAmount in
            let currency = offerAmount.currency ?? card.currency
            if currency == "USD" {
                return "Cash Offer:"
            } else {
                let pointValue = pointValue(for: currency) * 100
                return "\(offerAmount.amount.formatted(.number)) points @ \(String(format: "%.2f", pointValue))¢ per point:"
            }
        }
    }
    
}
