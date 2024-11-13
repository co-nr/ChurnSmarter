import SwiftUI

struct OfferCellView: View {
    
    @EnvironmentObject private var theme: ThemeManager
    @StateObject private var viewModel: OfferCellViewModel
    @State private var isShowingOfferValue = false
    
    init(card: Card) {
        _viewModel = StateObject(wrappedValue: OfferCellViewModel(card: card))
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            CardImageView(card: viewModel.card)
                .scaledToFill()
                .frame(height: 125)
                .clipped()
            
            VStack(alignment: .leading) {
                HStack(spacing: 4) {
                    VStack(alignment: .leading, spacing: 0) {
                        Text(viewModel.card.name)
                            .font(.headline)
                        Text(viewModel.card.issuer.format)
                            .font(.subheadline)
                            .foregroundStyle(theme.labelColor.secondary)
                    }
                    .multilineTextAlignment(.leading)
                    Spacer()
                    Button {
                        self.isShowingOfferValue = true
                    } label: {
                        Image(systemName: "info.circle")
                            .font(.footnote)
                            .foregroundStyle(theme.labelColor.secondary)
                    }
                    Text(viewModel.currentOfferValue)
                        .foregroundStyle(theme.labelColor)
                        .font(.headline)
                }
                .sheet(isPresented: $isShowingOfferValue) {
                    OfferValueView(card: viewModel.card)
                        .presentationDetents([.medium])
                }
                
                HStack {
                    Text("AF: $\(viewModel.card.annualFee)")
                        .modifier(OfferCellBadgeModifier(backgroundColor: viewModel.annualFeeColor))
                    
                    Text(String(format: "%.0f%% OF HISTORICAL MAX", viewModel.percentageOfHistoricalMax))
                        .modifier(OfferCellBadgeModifier(backgroundColor: viewModel.historicalMaxColor))
                }
                
                Divider()
                
                VStack(alignment: .leading) {
                    Text(viewModel.currentOffer)
                        .font(.subheadline)
                        .fontWeight(.medium)
                    Text(viewModel.currentOfferSpend)
                        .foregroundStyle(.secondary)
                        .font(.footnote)
                }
                .foregroundStyle(theme.labelColor)
            }
            .padding([.leading, .trailing, .bottom], 8)
        }
        .tint(theme.tintColor)
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
