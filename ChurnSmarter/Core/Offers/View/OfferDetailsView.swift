import SwiftUI

struct OfferDetailsView: View {
    
    @EnvironmentObject private var theme: ThemeManager
    let card: Card
    
    private var pointsValue: String? {
        if card.currency.lowercased() == "usd" {
            return nil
        }
        let pointValue = card.getPointValue(for: card.currency) * 100
        return String(format: "%.2f¢", pointValue)
    }
    
    var body: some View {
        NavigationStack {
            List {
                cardImageSection
                Section("Overview") {
                    HStack {
                        Text("Issuer")
                            .fontWeight(.medium)
                        Spacer()
                        Text(card.issuer.format)
                    }
                    HStack {
                        Text("Currency")
                            .fontWeight(.medium)
                        Spacer()
                        Text(card.currency.format)
                    }
                    if let pointsValue = pointsValue {
                        HStack {
                            Text("Points Value")
                                .fontWeight(.medium)
                            Spacer()
                            Text(pointsValue)
                        }
                    }
                    HStack {
                        Text("Annual Fee")
                            .fontWeight(.medium)
                        Spacer()
                        Text("$\(card.annualFee)")
                    }
                }
                .listRowBackground(theme.secondaryBackgroundColor)
            }
            .font(.subheadline)
            .background(theme.primaryBackgroundColor)
            .scrollContentBackground(.hidden)
            .navigationTitle(card.name)
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    OfferDetailsView(card: DeveloperPreview.card)
        .environmentObject(ThemeManager())
}

extension OfferDetailsView {
    private var cardImageSection: some View {
        Section {
            HStack {
                Spacer()
                CardImageView(card: card)
                    .scaledToFit()
                    .frame(maxHeight: 150)
                Spacer()
            }
        }
        .listRowBackground(Color.clear)
    }
}
