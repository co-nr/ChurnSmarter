import SwiftUI

struct OffersView: View {
    
    @StateObject private var viewModel = OffersViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                ForEach(viewModel.allCards) { card in
                    CardCell(card: card)
                }
            }
        }
    }
}

#Preview {
    OffersView()
}
