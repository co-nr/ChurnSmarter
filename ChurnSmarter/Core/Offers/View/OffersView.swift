import SwiftUI

struct OffersView: View {
    
    @StateObject private var viewModel = OffersViewModel()
    @EnvironmentObject private var theme: ThemeManager
    @State private var isShowingSettings = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                theme.primaryBackgroundColor.ignoresSafeArea()
                
                ScrollView(showsIndicators: false) {
                    LazyVStack {
                        ForEach(viewModel.allCards) { card in
                            CardCell(card: card)
                        }
                    }
                }
                .navigationTitle("Offers")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        Button {
                            isShowingSettings = true
                        } label: {
                            Image(systemName: "gear")
                        }
                    }
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
