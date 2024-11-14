import SwiftUI

struct OfferFiltersView: View {
    
    @EnvironmentObject private var theme: ThemeManager
    
    var body: some View {
        NavigationStack {
            Form {
                
            }
            .scrollContentBackground(.hidden)
            .navigationTitle("Filters")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar { CloseToolbarItem() }
        }
        .tint(theme.tintColor)
    }
}

#Preview {
    OfferFiltersView()
        .environmentObject(ThemeManager())
}
