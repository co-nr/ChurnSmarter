import SwiftUI

struct OfferCell: View {
    
    @EnvironmentObject private var theme: ThemeManager
    @State private var isShowingOfferValue = false
    private let card: Card
    private let calculator: OfferCalculator
    
    init(card: Card) {
        self.card = card
        self.calculator = OfferCalculator(card: card)
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            cardImageSection
            contentSection
        }
        .background(theme.secondaryBackgroundColor)
        .cornerRadius(10)
        .shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 5)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(theme.labelColor.opacity(0.3), lineWidth: 1)
        )
        .foregroundStyle(theme.labelColor)
        .padding(.horizontal, 10)
        .drawingGroup()
        .sheet(isPresented: $isShowingOfferValue) {
            OfferValueView(card: card)
                .presentationDetents([.medium])
        }
    }
}

#Preview {
    OfferCell(card: DeveloperPreview.card)
        .environmentObject(ThemeManager())
}

private extension OfferCell {
    // MARK: - Card Image Section
    var cardImageSection: some View {
        CardImageView(card: card)
            .scaledToFill()
            .frame(maxHeight: 125)
            .clipped()
    }
    
    // MARK: - Content Section
    var contentSection: some View {
        VStack(alignment: .leading) {
            headerSection
            badgeSection
            Divider()
            offerDetailsSection
        }
        .padding([.leading, .trailing, .bottom], 8)
    }
    
    // MARK: - Header Section
    var headerSection: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack(spacing: 4) {
                Text(card.name)
                    .foregroundStyle(theme.tintColor)
                    .lineLimit(1)
                Spacer()
                InfoButton(isShowingOfferValue: $isShowingOfferValue)
                Text("$\(calculator.highestOfferValue(), specifier: "%.0f")")
            }
            .font(.headline)
            Text(card.issuer.display)
                .font(.subheadline)
                .foregroundStyle(.secondary)
        }
    }
    
    // MARK: - Badge Section
    var badgeSection: some View {
        HStack {
            OfferBadge(type: .annualFee(card.annualFee))
            OfferBadge(type: .historicalMax(calculator.percentageOfHistoricalMax()))
        }
    }
    
    // MARK: - Offer Details Section
    var offerDetailsSection: some View {
        VStack(alignment: .leading, spacing: 2) {
            if let highestOffer = calculator.highestOffer() {
                Text(highestOffer.formattedAmount(using: card.currency))
                    .font(.subheadline)
                    .fontWeight(.medium)
                Text(highestOffer.formattedSpend)
                    .font(.footnote)
                    .foregroundStyle(.secondary)
            } else {
                Text("No offers available")
                    .font(.subheadline)
                    .fontWeight(.medium)
            }
        }
    }
}
