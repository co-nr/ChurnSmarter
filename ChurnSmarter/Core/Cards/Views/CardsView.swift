import SwiftUI

struct CardsView: View {
    
    @EnvironmentObject private var theme: ThemeManager
    @StateObject private var viewModel = CardsViewModel()
    @State private var isShowingFilters = false
    @State private var isShowingSettings = false
    
    var body: some View {
        NavigationStack {
            ScrollView {
                ForEach(viewModel.filteredCards) { card in
                    NavigationLink(destination: CardDetailsView(card: card)) {
                        CardOfferCell(card: card)
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
