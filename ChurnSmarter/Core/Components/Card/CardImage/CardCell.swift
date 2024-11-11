import SwiftUI

struct CardCell: View {
    
    @EnvironmentObject private var theme: ThemeManager
    let card: Card
    
    var body: some View {
        VStack(alignment: .leading) {
            CardImageView(card: card)
                .scaledToFill()
                .frame(height: 125)
                .clipped()
            
            VStack {
                HStack {
                    VStack(alignment: .leading, spacing: 0) {
                        Text(card.name)
                            .font(.headline)
                            .foregroundStyle(theme.tintColor)
                        Text(card.issuer.lowercased().replacingOccurrences(of: "_", with: " ").capitalized)
                            .font(.subheadline)
                            .foregroundStyle(theme.labelColor.secondary)
                    }
                    Spacer()
                    Text("$555")
                        .font(.headline)
                }
                Divider()
            }
            .padding([.leading, .trailing, .bottom], 8)
        }
        .background(theme.secondaryBackgroundColor)
        .cornerRadius(8)
        .shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 5)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
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
