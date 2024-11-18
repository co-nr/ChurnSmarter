import Foundation

extension String {
    var display: String {
        if self.count <= 3 {
            return self.uppercased()
        } else {
            return self.lowercased()
                .replacingOccurrences(of: "_", with: " ")
                .capitalized
        }
    }
}
