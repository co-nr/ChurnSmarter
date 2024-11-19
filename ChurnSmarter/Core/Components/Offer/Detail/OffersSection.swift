import SwiftUI

struct OffersSection: View {
    
    @EnvironmentObject private var theme: ThemeManager
    
    let title: String
    let offers: [Offer]
    let currency: String
    
    var body: some View {
        Section(title) {
            ForEach(offers, id: \.self) { offer in
                HStack {
                    VStack(alignment: .leading) {
                        Text(offer.formattedAmount(using: currency))
                            .fontWeight(.medium)
                        Text(offer.formattedSpend)
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
                    Spacer()
                    
                    if let urlString = offer.url, let url = URL(string: urlString) {
                        Link(destination: url) {
                            Image(systemName: "link")
                        }
                    }
                }
            }
        }
        .listRowBackground(theme.secondaryBackgroundColor)
    }
}
