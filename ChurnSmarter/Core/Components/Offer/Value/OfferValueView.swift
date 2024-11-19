import SwiftUI

struct OfferValueView: View {
    @EnvironmentObject private var theme: ThemeManager
    private let calculator: OfferCalculator
    let card: Card
    private let highestOffer: Offer?
    
    init(card: Card) {
        self.card = card
        self.calculator = OfferCalculator(card: card)
        self.highestOffer = calculator.highestOffer()
    }
    
    var body: some View {
        NavigationStack {
            List {
                Section {
                    if let highestOffer = highestOffer {
                        ForEach(Array(highestOffer.amount.enumerated()), id: \.offset) { index, offerAmount in
                            HStack {
                                Text(calculator.formattedDescriptions(for: highestOffer)[index])
                                    .fontWeight(.medium)
                                Spacer()
                                let grossValue = Double(offerAmount.amount) * calculator.pointValue(for: offerAmount.currency ?? card.currency)
                                Text("+$\(grossValue, specifier: "%.0f")")
                                    .foregroundStyle(.green)
                            }
                        }
                        
                        HStack {
                            Text("Annual Fee:")
                                .fontWeight(.medium)
                            Spacer()
                            Text("-$\(card.annualFee)")
                                .foregroundStyle(.red)
                        }
                        
                        HStack {
                            Text("Net Value:")
                                .fontWeight(.medium)
                            Spacer()
                            Text("$\(calculator.highestOfferValue(), specifier: "%.0f")")
                                .bold()
                        }
                    } else {
                        Text("No offers available.")
                            .fontWeight(.medium)
                            .foregroundStyle(.secondary)
                    }
                } header: {
                    Text("Offer Value")
                } footer: {
                    HStack {
                        Spacer()
                        Text("Excluding Credits")
                        Spacer()
                    }
                }
                .listRowBackground(theme.secondaryBackgroundColor)
            }
            .font(.subheadline)
            .background(theme.primaryBackgroundColor)
            .scrollContentBackground(.hidden)
            .navigationTitle(card.name)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar { CloseToolbarItem() }
        }
        .tint(theme.tintColor)
    }
}



#Preview {
    OfferValueView(card: DeveloperPreview.card)
        .environmentObject(ThemeManager())
}
