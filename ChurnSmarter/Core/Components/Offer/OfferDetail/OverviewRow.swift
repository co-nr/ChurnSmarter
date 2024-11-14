import SwiftUI

struct OverviewRow: View {
    let title: String
    let value: String
    
    var body: some View {
        HStack {
            Text("\(title):")
                .fontWeight(.medium)
            Spacer()
            Text(value)
        }
    }
}

