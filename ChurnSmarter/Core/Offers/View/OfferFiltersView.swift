import SwiftUI

struct OfferFiltersView: View {
    
    @EnvironmentObject private var theme: ThemeManager
    
    var body: some View {
        Text("Offer Filters")
    }
}

#Preview {
    OfferFiltersView()
        .environmentObject(ThemeManager())
}
