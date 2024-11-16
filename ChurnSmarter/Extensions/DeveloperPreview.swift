import SwiftUI

struct DeveloperPreview {
    static let card = Card(
        name: "Gold",
        issuer: "AMERICAN_EXPRESS",
        network: "AMERICAN_EXPRESS",
        currency: "AMERICAN_EXPRESS",
        countsTowards524: true,
        details: "Sample details about the card",
        isBusiness: false,
        annualFee: 350,
        isAnnualFeeWaived: false,
        universalCashbackPercent: 1.0,
        url: "https://www.americanexpress.com/us/credit-cards/card/gold-card/",
        imageUrl: "/images/amex/gold.webp",
        credits: [
            Credit(description: "$10/mo credit for Uber", value: 120, weight: 0.4),
            Credit(description: "$10/mo credit for Grubhub, Cheesecake Factory, Gold Belly, Wine.com, Milk, Shake Shack", value: 120, weight: 0.5),
            Credit(description: "$7/mo credit for Dunkin", value: 84, weight: 0.4),
            Credit(description: "Semi-annual $50 Resy credit", value: 100, weight: 0.75)
        ],
        offers: [
            Offer(
                spend: 6000,
                amount: [
                    OfferAmount(amount: 75000, currency: "AMERICAN_EXPRESS"),
                    OfferAmount(amount: 250, currency: "USD")
                ],
                days: 180, expiration: "2024-03-01",
                credits: [],
                details: nil, url: "https://resy.com/amex-offers?date=2022-07-16&seats=2",
                referralUrl: nil
            ),
            Offer(
                spend: 6000,
                amount: [
                    OfferAmount(amount: 75000, currency: "AMERICAN_EXPRESS")
                ],
                days: 180, expiration: "2024-03-01",
                credits: [],
                details: "Inconsistent. Try incognito mode.", url: nil,
                referralUrl: "https://americanexpress.com/en-us/referral/ANDENa0UQA"
            ),
            Offer(
                spend: 6000,
                amount: [
                    OfferAmount(amount: 60000, currency: "AMERICAN_EXPRESS")
                ],
                days: 180, expiration: "2024-03-01",
                credits: [],
                details: nil, url: nil,
                referralUrl: "https://americanexpress.com/en-us/referral/ANDENa0UQA"
            )
        ],
        historicalOffers: [
            Offer(
                spend: 4000,
                amount: [
                    OfferAmount(amount: 90000, currency: "AMERICAN_EXPRESS")
                ],
                days: 180,
                expiration: "2024-03-01", credits: [],
                details: nil, url: nil,
                referralUrl: nil
            )
        ]
    )
}
