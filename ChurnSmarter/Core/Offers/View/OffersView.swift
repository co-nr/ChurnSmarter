import SwiftUI

struct OffersView: View {
    
    @Environment(\.horizontalSizeClass) private var horizontalSizeClass
    @StateObject private var viewModel = OffersViewModel()
    @EnvironmentObject private var theme: ThemeManager
    @State private var isShowingSettings = false
    @State private var isShowingFilters = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                theme.primaryBackgroundColor.ignoresSafeArea()
                
                ScrollView(showsIndicators: false) {
                    if horizontalSizeClass == .compact {
                        LazyVStack(spacing: 15) {
                            ForEach(viewModel.filteredCards) { card in
                                NavigationLink(destination: OfferDetailsView(card: card)) {
                                    OfferCellView(card: card)
                                }
                            }
                        }
                    } else {
                        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 15) {
                            ForEach(viewModel.filteredCards) { card in
                                NavigationLink(destination: OfferDetailsView(card: card)) {
                                    OfferCellView(card: card)
                                }
                            }
                        }
                    }
                }
                .searchable(text: $viewModel.searchText, prompt: "Card Name or Issuer")
                .navigationTitle("Offers (\(viewModel.filteredCards.count))")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button {
                            self.isShowingFilters = true
                        } label: {
                            Image(systemName: "line.3.horizontal.decrease.circle")
                        }
                    }
                    ToolbarItem(placement: .topBarLeading) {
                        Button {
                            self.isShowingSettings = true
                        } label: {
                            Image(systemName: "gear")
                        }
                    }
                }
                .sheet(isPresented: $isShowingFilters) {
                    OfferFiltersView()
                        .environmentObject(viewModel)
                        .presentationDetents([.medium, .large])
                        .presentationBackground(.thinMaterial)
                }
                .sheet(isPresented: $isShowingSettings) {
                    SettingsView()
                }
            }
        }
        .tint(theme.tintColor)
    }
}

#Preview {
    OffersView()
        .environmentObject(ThemeManager())
}
