import SwiftUI

struct OffersView: View {
    
    @StateObject private var viewModel = OffersViewModel()
    @EnvironmentObject private var theme: ThemeManager
    @State private var isShowingSettings = false
    @State private var isShowingFilters = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                theme.primaryBackgroundColor.ignoresSafeArea()
                
                ScrollView(showsIndicators: false) {
                    LazyVStack {
                        ForEach(viewModel.allCards) { card in
                            NavigationLink(destination: OfferDetailsView(card: card)) {
                                OfferCell(card: card)
                            }
                        }
                    }
                }
                .navigationTitle("Offers")
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
