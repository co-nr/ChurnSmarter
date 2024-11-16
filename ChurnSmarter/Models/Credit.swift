import Foundation

struct Credit: Decodable, Hashable {
    let description: String?
    let value: Double?
    let weight: Double?
}
