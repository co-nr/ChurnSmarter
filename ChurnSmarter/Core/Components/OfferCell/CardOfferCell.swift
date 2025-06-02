import SwiftUI

struct CardOfferCell: View {
    
    @EnvironmentObject private var theme: ThemeManager
    @State private var isShowingOfferValue = false
    let card: Card
    
    var body: some View {
        VStack(alignment: .leading) {
            cardImage
            offerContent
        }
        .background(theme.secondaryBackgroundColor)
        .foregroundStyle(theme.labelColor)
        .cornerRadius(10)
        .drawingGroup()
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(theme.labelColor.opacity(0.3), lineWidth: 1)
        )
        .padding(.horizontal, 10)
        .sheet(isPresented: $isShowingOfferValue) {
            OfferValueView(card: card)
                .presentationDetents([.medium])
        }
    }
}

#Preview {
    PreviewWrapper {
        CardOfferCell(card: DeveloperPreview.card)
    }
}

private extension CardOfferCell {
    
    var cardImage: some View {
        CardImageView(card: card)
            .scaledToFill()
            .frame(maxHeight: 125)
            .clipped()
    }
    
    var offerContent: some View {
        VStack(alignment: .leading) {
            offerHeader
            offerBadges
            Divider()
            offerDetails
        }
        .padding([.leading, .trailing, .bottom], 8)
    }
    
    var offerHeader: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack(spacing: 4) {
                Text(card.name)
                    .lineLimit(1)
                Spacer()
                InfoButton(isShowingOfferValue: $isShowingOfferValue)
                Text("$\(Int(card.bestOffer?.value ?? 0))")
            }
            .font(.headline)
            Text(card.issuer.display)
                .font(.subheadline)
                .foregroundStyle(.secondary)
        }
    }
    
    var offerBadges: some View {
        HStack {
            CardOfferBadge(type: .annualFee(card.annualFee))
            CardOfferBadge(type: .historicalMax(card.historicalMax))
        }
    }
    
    var offerDetails: some View {
        VStack(alignment: .leading) {
            if let result = card.bestOffer {
                Text(result.offer.formattedAmount(defaultCurrency: card.currency))
                    .font(.subheadline)
                    .fontWeight(.medium)
                Text(result.offer.formattedSpend)
                    .font(.footnote)
                    .foregroundStyle(.secondary)
            } else {
                Text("No offers available")
                    .foregroundStyle(.secondary)
            }
        }
    }
    
}
