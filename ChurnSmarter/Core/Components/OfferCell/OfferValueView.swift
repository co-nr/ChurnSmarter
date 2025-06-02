import SwiftUI

struct OfferValueView: View {
    
    @EnvironmentObject private var theme: ThemeManager
    let card: Card
    
    var body: some View {
        NavigationStack {
            List {
                if let best = card.bestOffer {
                    Section("Offer Value") {
                        HStack {
                            Text(card.currency == .usd ? "Cash offer" : best.offer.pointBreakdown(currency: card.currency)
                            )
                            .fontWeight(.medium)

                            Spacer()
                            
                            Text("+$\(Int(best.value + card.annualFee))")
                                .foregroundStyle(.green)
                        }

                        HStack {
                            Text("Annual Fee")
                                .fontWeight(.medium)
                            Spacer()
                            Text("-$\(card.annualFee.formatted())")
                                .foregroundStyle(.red)
                        }
                        HStack {
                            Text("Net Value")
                                .fontWeight(.medium)
                            Spacer()
                            Text("$\(Int(card.bestOffer?.value ?? 0))")
                                .bold()
                        }
                    }
                    .listRowBackground(theme.secondaryBackgroundColor)
                }
            }
            .font(.subheadline)
            .applyThemedList(title: card.name)
            .toolbar { CloseToolbarItem() }
        }
    }
}

#Preview {
    PreviewWrapper {
        OfferValueView(card: DeveloperPreview.card)
    }
}
