import Foundation

extension String {
    var format: String {
        self.lowercased()
            .replacingOccurrences(of: "_", with: " ")
            .capitalized
    }
}
