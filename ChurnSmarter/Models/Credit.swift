import Foundation

struct Credit: Decodable, Hashable {
    let description: String?
    let value: Int?
    let weight: Double?
}
