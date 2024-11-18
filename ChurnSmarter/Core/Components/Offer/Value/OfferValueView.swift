import SwiftUI

struct OfferValueView: View {
    
    @EnvironmentObject private var theme: ThemeManager
    private let calculator: OfferCalculator
    let card: Card
    
    init(card: Card) {
        self.card = card
        self.calculator = OfferCalculator(card: card)
    }
    
    var body: some View {
        NavigationStack {
            List {
                Section {
                    HStack {
//                        Text(calculator.offerBreakdownText)
//                            .fontWeight(.medium)
//                        Spacer()
//                        Text(calculator.grossOfferValue)
                    }
                    HStack {
                        Text("Annual Fee:")
                            .fontWeight(.medium)
                        Spacer()
                        Text("-$\(card.annualFee)")
                    }
                    HStack {
                        Text("Net Value:")
                            .fontWeight(.medium)
                        Spacer()
//                        Text(calculator.netOfferValue)
//                            .foregroundStyle(theme.tintColor)
//                            .bold()
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
    OffersView()
        .environmentObject(ThemeManager())
}
