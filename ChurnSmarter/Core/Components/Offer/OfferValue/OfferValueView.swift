import SwiftUI

struct OfferValueView: View {
    
    @EnvironmentObject private var theme: ThemeManager
    let card: Card
    
    var body: some View {
        NavigationStack {
            List {
                
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
