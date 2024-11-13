import Foundation

final class OfferCalculator {
    
    private let card: Card
    
    init(card: Card) {
        self.card = card
    }
    
    func getPointValue(for currency: String) -> Double {
        return pointValues[currency] ?? 0.01
    }
    
    var currentOfferValue: String {
        guard let highestAmount = card.offers.compactMap({ $0.highestAmount }).max(), highestAmount > 0 else {
            return "$0.00"
        }
        
        let pointValue = getPointValue(for: card.currency)
        let monetaryValue = Double(highestAmount) * pointValue
        
        let netValue = monetaryValue - Double(card.annualFee)
        
        return String(format: "$%.0f", netValue)
    }
}
