import SwiftUI

struct CardsView: View {
    
    private var adaptiveColumns: [GridItem] {
        [GridItem(.adaptive(minimum: 300), spacing: 5)]
    }
    @EnvironmentObject private var theme: ThemeManager
    @StateObject private var viewModel = CardsViewModel()
    @State private var isShowingFilters = false
    @State private var isShowingSettings = false
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: adaptiveColumns, spacing: 15) {
                    ForEach(viewModel.filteredCards) { card in
                        NavigationLink(destination: CardDetailsView(card: card)) {
                            CardOfferCell(card: card)
                                .scrollTransition(.animated.threshold(.visible(0.1))) { content, phase in
                                    content
                                        .opacity(phase.isIdentity ? 1 : 0)
                                        .scaleEffect(phase.isIdentity ? 1 : 0.80)
                                }
                        }
                    }
                }
            }
            .searchable(text: $viewModel.searchText, prompt: "Card Name or Issuer")
            .applyThemedList(title: "Cards (\(viewModel.filteredCards.count))")
            .toolbar {
                CardsToolbar(
                    isShowingFilters: $isShowingFilters,
                    isShowingSettings: $isShowingSettings
                )
            }
            .sheet(isPresented: $isShowingSettings) {
                SettingsView()
            }
            .sheet(isPresented: $isShowingFilters) {
                CardFiltersView()
                    .environmentObject(viewModel)
                    .presentationDetents([.medium, .large])
            }
        }
    }
}

#Preview {
    PreviewWrapper {
        CardsView()
    }
}
