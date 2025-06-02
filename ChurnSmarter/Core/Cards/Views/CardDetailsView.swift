import SwiftUI

struct CardDetailsView: View {
    
    @EnvironmentObject private var theme: ThemeManager
    let card: Card
    
    var body: some View {
        List {
            image
            overview
            if !card.offers.isEmpty {
                OffersSection(title: "Current Offers", offers: card.offers, currency: card.currency)
            }
            if !card.historicalOffers.isEmpty {
                OffersSection(title: "Historical Offers", offers: card.historicalOffers, currency: card.currency)
            }
            if !card.credits.isEmpty {
                CreditsSection(title: "Credits", credits: card.credits)
            }
        }
        .font(.subheadline)
        .navigationBarBackButtonHidden(true)
        .applyThemedList(title: card.name)
        .toolbar { CloseToolbarItem() }
    }
}

#Preview {
    PreviewWrapper {
        NavigationStack {
            CardDetailsView(card: DeveloperPreview.card)
        }
    }
}

private extension CardDetailsView {
    
    var image: some View {
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
    
    var overview: some View {
        Section("Overview") {
            OverviewRow(title: "Issuer", value: card.issuer.display)
            OverviewRow(title: "Currency", value: card.currency.display)
            if card.currency != .usd {
                OverviewRow(title: "Point Value", value: card.currency.pointValueDisplay)
            }
            OverviewRow(title: "Annual Fee", value: "$\(card.annualFee.formatted())")
            OverviewRow(title: "Official Page", value: card.url)
            if let referral = card.referralLink {
                OverviewRow(title: "Referral Link", value: referral)
            }
        }
        .listRowBackground(theme.secondaryBackgroundColor)
    }
    
}
