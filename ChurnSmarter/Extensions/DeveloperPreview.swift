import SwiftUI

struct DeveloperPreview {
    static let card = Card(
        cardId: "cafe43d37256bec116dff4be6cced2cf",
        name: "Gold",
        issuer: .americanExpress,
        network: .americanExpress,
        currency: .americanExpress,
        isBusiness: false,
        annualFee: 350,
        isAnnualFeeWaived: false,
        universalCashbackPercent: 1,
        url: "https://www.americanexpress.com/us/credit-cards/card/gold-card/",
        imageUrl: "/images/amex/gold.webp",
        credits: [
            Credit(description: "$10/mo credit for Uber", value: 120, weight: 0.4),
            Credit(description: "$10/mo credit for Grubhub, Cheesecake Factory, Gold Belly, Wine.com, Milk, Shake Shack", value: 120, weight: 0.5),
            Credit(description: "$7/mo credit for Dunkin", value: 84, weight: 0.4),
            Credit(description: "Semi-annual $50 Resy credit", value: 100, weight: 0.8)
        ],
        offers: [
            Offer(
                spend: 6000,
                amount: [OfferAmount(amount: 90000, currency: .americanExpress)],
                days: 180,
                credits: [],
                details: "Requires Incognito, YMMV.",
                expiration: nil,
                url: nil,
                referralUrl: nil
            ),
            Offer(
                spend: 6000,
                amount: [OfferAmount(amount: 75000, currency: .americanExpress), OfferAmount(amount: 250, currency: .usd)],
                days: 180,
                credits: [],
                details: nil,
                expiration: nil,
                url: "https://resy.com/amex-offers",
                referralUrl: nil
            ),
            Offer(
                spend: 6000,
                amount: [OfferAmount(amount: 60000, currency: .americanExpress)],
                days: 180,
                credits: [],
                details: nil,
                expiration: nil,
                url: nil,
                referralUrl: nil
            )
        ],
        historicalOffers: [
            Offer(
                spend: 4000,
                amount: [OfferAmount(amount: 90000, currency: .americanExpress)],
                days: 180,
                credits: [],
                details: nil,
                expiration: "2024-03-01",
                url: nil,
                referralUrl: nil
            )
        ],
        discontinued: false
    )
}
