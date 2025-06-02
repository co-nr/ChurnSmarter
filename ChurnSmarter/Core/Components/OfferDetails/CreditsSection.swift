import SwiftUI

struct CreditsSection: View {
    
    @EnvironmentObject private var theme: ThemeManager
    
    let title: String
    let credits: [Credit]
    
    var body: some View {
        Section(title) {
            ForEach(credits, id: \.self) { credit in
                HStack(spacing: 10) {
                    Circle()
                        .frame(width: 8, height: 8)
                        .foregroundStyle(theme.tintColor)
                    
                    Text(credit.description)
                        .fontWeight(.medium)
                }
            }
        }
        .listRowBackground(theme.secondaryBackgroundColor)
    }
}
