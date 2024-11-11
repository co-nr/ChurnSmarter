import Foundation

struct Offer: Decodable {
    let spend: Double
    let amount: [OfferAmount]
    let days: Int
    let expiration: String?
    let isPublic: Bool?
    let credits: [Credit]
    let details: String?
    let url: String?
    let referralUrl: String?
}

struct OfferAmount: Decodable {
    let amount: Int
    let currency: String?
}
