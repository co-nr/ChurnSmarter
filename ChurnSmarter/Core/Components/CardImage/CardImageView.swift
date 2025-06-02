import SwiftUI

struct CardImageView: View {
    
    @StateObject private var viewModel: CardImageViewModel
    
    init(card: Card) {
        _viewModel = StateObject(wrappedValue: CardImageViewModel(card: card))
    }
    
    var body: some View {
        ZStack {
            if let image = viewModel.image {
                Image(uiImage: image)
                    .resizable()
            } else if viewModel.isLoading {
                Image("creditcard")
                    .resizable()
            }
        }
    }
}
