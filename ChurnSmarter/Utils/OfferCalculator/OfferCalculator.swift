import Foundation

final class OfferCalculator {
    
    private let card: Card
    
    init(card: Card) {
        self.card = card
    }
    
    func getPointValue(for currency: String) -> Double {
        return pointValues[currency] ?? 0.01
    }
    
    var offerBreakdownText: String {
        guard let highestAmount = card.offers.compactMap({ $0.highestAmount }).max(), highestAmount > 0 else {
            return "No offers available"
        }
        
        if card.currency == "USD" {
            return "Gross Value:"
        }
        
        let pointValue = getPointValue(for: card.currency) * 100
        return "\(highestAmount.formatted(.number)) points @ \(String(format: "%.2f", pointValue))¢ per point:"
    }
    
    var grossOfferValue: String {
        guard let highestAmount = card.offers.compactMap({ $0.highestAmount }).max(), highestAmount > 0 else {
            return "$0"
        }
        
        let pointValue = getPointValue(for: card.currency)
        let totalValue = Double(highestAmount) * pointValue
        
        return String(format: "$%.0f", totalValue)
    }
    
    var netOfferValue: String {
        guard let highestAmount = card.offers.compactMap({ $0.highestAmount }).max(), highestAmount > 0 else {
            return "$0"
        }
        
        let pointValue = getPointValue(for: card.currency)
        let monetaryValue = Double(highestAmount) * pointValue
        let netValue = monetaryValue - Double(card.annualFee)
        
        return String(format: "$%.0f", netValue)
    }
}

