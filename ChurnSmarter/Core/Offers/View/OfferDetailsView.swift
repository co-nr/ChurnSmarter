import SwiftUI

struct OfferDetailsView: View {
    
    @EnvironmentObject private var theme: ThemeManager
    let card: Card
    private let calculator: OfferCalculator
    
    init(card: Card) {
        self.card = card
        self.calculator = OfferCalculator(card: card)
    }
    
    var body: some View {
        NavigationStack {
            List {
                cardImageSection
                overviewSection
                if !card.offers.isEmpty {
                    OffersSection(title: "Current Offers", offers: card.offers, currency: card.currency.format)
                }
                if !card.historicalOffers.isEmpty {
                    OffersSection(title: "Historical Offers", offers: card.historicalOffers, currency: card.currency.format)
                }
                
                if !card.credits.isEmpty {
                    CreditsSection(title: "Credits", credits: card.credits)
                }
                
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
    OffersView()
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
    
    private var overviewSection: some View {
        Section("Overview") {
            OverviewRow(title: "Issuer", value: card.issuer.format)
            OverviewRow(title: "Currency", value: card.currency.format)
            OverviewRow(title: "Annual Fee", value: "$\(card.annualFee)")
            if card.currency != "USD" {
                OverviewRow(title: "Points Value", value: "\(String(format: "%.2f", calculator.getPointValue(for: card.currency) * 100))¢")
            }
            if let url = URL(string: card.url) {
                HStack {
                    Text("Official Page:")
                        .fontWeight(.medium)
                    Spacer()
                    Link(destination: url) {
                        Image(systemName: "link")
                    }
                }
            }
            if let referralLink = card.referralLink {
                HStack {
                    Text("Referral Link:")
                        .fontWeight(.medium)
                    Spacer()
                    Link(destination: referralLink) {
                        Image(systemName: "link")
                    }
                }
            }
        }
        .listRowBackground(theme.secondaryBackgroundColor)
    }
}
