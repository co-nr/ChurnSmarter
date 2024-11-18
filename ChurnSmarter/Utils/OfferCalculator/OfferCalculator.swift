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
}
