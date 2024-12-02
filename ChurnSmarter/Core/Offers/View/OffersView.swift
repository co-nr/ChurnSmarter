import SwiftUI

struct OffersView: View {
    
    @Environment(\.horizontalSizeClass) private var horizontalSizeClass
    @StateObject private var viewModel = OffersViewModel()
    @EnvironmentObject private var theme: ThemeManager
    @State private var isShowingSettings = false
    @State private var isShowingFilters = false
    
    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                if horizontalSizeClass == .compact {
                    LazyVStack(spacing: 12) {
                        ForEach(viewModel.filteredCards) { card in
                            NavigationLink(destination: OfferDetailsView(card: card)) {
                                OfferCell(card: card)
                            }
                        }
                    }
                } else {
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 20) {
                        ForEach(viewModel.filteredCards) { card in
                            NavigationLink(destination: OfferDetailsView(card: card)) {
                                OfferCell(card: card)
                            }
                        }
                    }
                    .padding([.horizontal])
                }
            }
            .background(theme.primaryBackgroundColor)
            .searchable(text: $viewModel.searchText, prompt: "Card Name or Issuer")
            .navigationTitle("Offers (\(viewModel.filteredCards.count))")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button("Filters", systemImage: "line.3.horizontal.decrease.circle") {
                        isShowingFilters.toggle()
                    }
                }
                ToolbarItem(placement: .topBarLeading) {
                    Button("Settings", systemImage: "gear") {
                        isShowingSettings.toggle()
                    }
                }
            }
            .sheet(isPresented: $isShowingFilters) {
                OfferFiltersView()
                    .environmentObject(viewModel)
                    .presentationDetents([.medium, .large])
            }
            .sheet(isPresented: $isShowingSettings) {
                SettingsView()
            }
        }
        .tint(theme.tintColor)
    }
}

#Preview {
    OffersView()
        .environmentObject(ThemeManager())
}
