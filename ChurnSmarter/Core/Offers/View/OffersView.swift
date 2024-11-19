import SwiftUI

struct OffersView: View {
    
    @Environment(\.horizontalSizeClass) private var horizontalSizeClass
    @StateObject private var viewModel = OffersViewModel()
    @EnvironmentObject private var theme: ThemeManager
    @State private var isShowingSettings = false
    @State private var isShowingFilters = false
    @Namespace private var namespace
    
    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                if horizontalSizeClass == .compact {
                    VStack(spacing: 12) {
                        ForEach(viewModel.filteredCards) { card in
                            NavigationLink(destination: OfferDetailsView(card: card)) {
                                offerCell(for: card)
                            }
                        }
                    }
                } else {
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 20) {
                        ForEach(viewModel.filteredCards) { card in
                            NavigationLink(destination: OfferDetailsView(card: card)) {
                                offerCell(for: card)
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

private extension OffersView {
    @ViewBuilder
    func offerCell(for card: Card) -> some View {
        if #available(iOS 18, *) {
            OfferCell(card: card)
                .matchedTransitionSource(id: "zoom", in: namespace)
                .scrollTransition(.animated.threshold(.visible(0.1))) { content, phase in
                    content
                        .opacity(phase.isIdentity ? 1 : 0)
                        .scaleEffect(phase.isIdentity ? 1 : 0.80)
                }
        } else {
            OfferCell(card: card)
        }
    }
}
