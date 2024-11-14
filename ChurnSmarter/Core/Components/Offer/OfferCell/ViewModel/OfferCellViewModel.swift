import SwiftUI

final class OfferCellViewModel: ObservableObject {
    
    private let calculator: OfferCalculator
    @Published var card: Card
    
    init(card: Card) {
        self.card = card
        self.calculator = OfferCalculator(card: card)
    }
    
    var annualFeeColor: Color {
        switch card.annualFee {
        case 0: return .green
        case 1..<100: return .yellow
        default: return .red
        }
    }
    
    var historicalMaxColor: Color {
        switch percentageOfHistoricalMax {
        case 100...: return .green
        case 50..<100: return .yellow
        default: return .red
        }
    }
    
    var percentageOfHistoricalMax: Double {
        let highestHistoricalOffer = card.historicalOffers.compactMap { $0.highestAmount }.max() ?? 0
        let highestCurrentOffer = card.offers.compactMap { $0.highestAmount }.max() ?? 0
        return highestHistoricalOffer == 0 ? 100 : (Double(highestCurrentOffer) / Double(highestHistoricalOffer)) * 100
    }
    
    var currentOfferValueText: String {
        return calculator.netOfferValue
    }
    
    var currentOfferText: String {
        if let amount = card.offers.compactMap({ $0.highestAmount }).max() {
            return "\(amount.formatted(.number)) \(card.currency.format)"
        }
        return "No offers available"
    }
    
    var currentOfferSpendText: String {
        if let highestOffer = card.offers.max(by: { $0.highestAmount < $1.highestAmount }) {
            return String(format: "Spend $%@ in %d days", highestOffer.spend.formatted(.number), highestOffer.days)
        }
        return ""
    }
}
