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
                        LazyVStack(spacing: 12) {
                            ForEach(viewModel.filteredCards) { card in
                                NavigationLink(destination: OfferDetailsView(card: card)) {
                                    OfferCell(card: card)
//                                        .scrollTransition(.animated.threshold(.visible(0.1))) { content, phase in
//                                            content
//                                                .opacity(phase.isIdentity ? 1 : 0)
//                                                .scaleEffect(phase.isIdentity ? 1 : 0.85)
//                                        }
                                        .padding(.horizontal, 10)
                                }
                            }
                        }
                    } else {
                        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 15) {
                            ForEach(viewModel.filteredCards) { card in
                                NavigationLink(destination: OfferDetailsView(card: card)) {
                                    OfferCell(card: card)
                                        .padding(.horizontal, 10)
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
