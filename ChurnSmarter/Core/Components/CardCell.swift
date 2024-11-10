import SwiftUI

struct CardCell: View {
    
    @EnvironmentObject private var theme: ThemeManager
    let card: Card
    
    var body: some View {
        VStack(alignment: .leading) {
            CardImageView(card: card)
                .scaledToFit()
                .frame(height: 120)
            
            Text(card.name)
        }
    }
}

#Preview {
    OffersView()
        .environmentObject(ThemeManager())
}
