import SwiftUI

struct OverviewRow: View {
    
    let title: String
    let value: String

    var body: some View {
        HStack {
            Text("\(title):")
                .fontWeight(.medium)
            Spacer()
            
            if let url = URL(string: value), value.hasPrefix("http") {
                Link(destination: url) {
                    Image(systemName: "link")
                }
            } else {
                Text(value)
            }
        }
    }
}

