import SwiftUI

struct OffersSection: View {
    
    @EnvironmentObject private var theme: ThemeManager
    
    let title: String
    let offers: [Offer]
    let currency: String
    
    var body: some View {
        Section(title) {
            ForEach(offers, id: \.self) { offer in
                VStack(alignment: .leading) {
                    ForEach(offer.amount, id: \.self) { amount in
                        Text("\(amount.amount.formatted(.number)) \(amount.currency ?? currency)")
                            .fontWeight(.medium)
                    }
                    Text(String(format: "Spend $%@ in %d days", offer.spend.formatted(.number), offer.days))
                        .font(.footnote)
                        .foregroundStyle(.secondary)
                    
                    if let details = offer.details {
                        Text(details)
                            .font(.footnote)
                            .foregroundStyle(.secondary)
                    }
                    
                    if let expiration = offer.expiration {
                        Text("Expired: \(expiration)")
                            .font(.caption)
                            .foregroundStyle(.secondary)
                    }
                }
            }
        }
        .listRowBackground(theme.secondaryBackgroundColor)
    }
}
