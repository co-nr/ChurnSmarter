import SwiftUI

struct CardCell: View {
    
    @EnvironmentObject private var theme: ThemeManager
    let card: Card
    
    private func annualFeeColor() -> Color {
        if card.annualFee == 0 {
            return Color.green.opacity(0.4)
        } else if card.annualFee < 100 {
            return Color.yellow.opacity(0.4)
        } else {
            return Color.red.opacity(0.4)
        }
    }
    
    private func topHistoricalOffer() -> Int {
        return card.historicalOffers.compactMap { $0.amount.first?.amount }.max() ?? 0
    }
    
    private func percentageOfHistoricalMax() -> Double {
        guard let currentOffer = card.offers.first?.amount.first?.amount else { return 0 }
        let topOffer = topHistoricalOffer()
        
        if topOffer == 0 { return 100 }
        
        return (Double(currentOffer) / Double(topOffer)) * 100
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            CardImageView(card: card)
                .scaledToFill()
                .frame(height: 125)
                .clipped()
            
            VStack(alignment: .leading) {
                HStack {
                    VStack(alignment: .leading, spacing: 0) {
                        Text(card.name)
                            .font(.headline)
                            .foregroundStyle(theme.tintColor)
                        Text(card.issuer.format)
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                    }
                    .multilineTextAlignment(.leading)
                    Spacer()
                    Text("$555")
                        .font(.headline)
                }
                
                HStack {
                    Text("AF: $\(card.annualFee)")
                        .font(.caption)
                        .fontWeight(.semibold)
                        .padding(4)
                        .background(annualFeeColor())
                        .cornerRadius(4)
                    
                    let percentage = percentageOfHistoricalMax()
                    Text(String(format: "%.0f%% OF HISTORICAL MAX", percentage))
                        .font(.caption)
                        .fontWeight(.semibold)
                        .padding(4)
                        .background(percentage >= 100 ? Color.green.opacity(0.4) : Color.yellow.opacity(0.4))
                        .cornerRadius(4)
                }
                
                Divider()
                VStack(alignment: .leading) {
                    if let firstOffer = card.offers.first, let amount = firstOffer.amount.first {
                        Text("\(amount.amount) \(amount.currency?.format ?? card.currency.format)")
                            .font(.subheadline)
                            .fontWeight(.medium)
                        Text("Spend $\(firstOffer.spend, specifier: "%.0f") in \(firstOffer.days) days")
                            .foregroundStyle(.secondary)
                            .font(.footnote)
                    } else {
                        Text("No offers available")
                            .foregroundStyle(.secondary)
                            .font(.footnote)
                    }
                }
            }
            .padding([.leading, .trailing, .bottom], 8)
        }
        .foregroundStyle(theme.labelColor)
        .background(theme.secondaryBackgroundColor)
        .cornerRadius(8)
        .shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 5)
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(theme.labelColor.opacity(0.3), lineWidth: 1)
        )
        .padding(.horizontal, 10)
        .padding(.vertical, 3)
    }
}

#Preview {
    OffersView()
        .environmentObject(ThemeManager())
}
