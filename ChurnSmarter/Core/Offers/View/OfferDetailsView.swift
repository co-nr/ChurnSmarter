import SwiftUI

struct OfferDetailsView: View {
    
    @EnvironmentObject private var theme: ThemeManager
    let card: Card
    
    var body: some View {
        NavigationStack {
            List {
                cardImageSection
            }
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
