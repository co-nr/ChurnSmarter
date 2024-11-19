import SwiftUI

struct OfferDetailsView: View {
    
    @EnvironmentObject private var theme: ThemeManager
    private let card: Card
    private let calculator: OfferCalculator
    @Namespace private var namespace
    
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
                    OffersSection(title: "Current Offers", offers: card.offers, currency: card.currency.display)
                }
                if !card.historicalOffers.isEmpty {
                    OffersSection(title: "Historical Offers", offers: card.historicalOffers, currency: card.currency.display)
                }
                
                if !card.credits.isEmpty {
                    CreditsSection(title: "Credits", credits: card.credits)
                }
                
            }
            .applyiOS18Modifiers(namespace: namespace)
            .font(.subheadline)
            .background(theme.primaryBackgroundColor)
            .scrollContentBackground(.hidden)
            .navigationTitle(card.name)
            .navigationBarTitleDisplayMode(.inline)
            .tint(theme.tintColor)
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
    
    private var overviewSection: some View {
        Section("Overview") {
            OverviewRow(title: "Issuer", value: card.issuer.display)
            OverviewRow(title: "Currency", value: card.currency.display)
            OverviewRow(title: "Annual Fee", value: "$\(card.annualFee)")
            if card.currency != "USD" {
                OverviewRow(title: "Points Value", value: "\(String(format: "%.2f", calculator.pointValue(for: card.currency) * 100))¢")
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

private extension View {
    @ViewBuilder
    func applyiOS18Modifiers(namespace: Namespace.ID) -> some View {
        if #available(iOS 18, *) {
            self
                .navigationBarBackButtonHidden()
                .navigationTransition(.zoom(sourceID: "zoom", in: namespace))
                .toolbar { CloseToolbarItem() }
        } else {
            self
        }
    }
}
