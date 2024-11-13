import SwiftUI

struct OfferCellBadgeModifier: ViewModifier {
    @EnvironmentObject private var theme: ThemeManager
    var backgroundColor: Color
    
    func body(content: Content) -> some View {
        content
            .font(.caption)
            .fontWeight(.semibold)
            .foregroundStyle(theme.labelColor)
            .padding(4)
            .background(backgroundColor.opacity(0.4))
            .cornerRadius(4)
    }
}

