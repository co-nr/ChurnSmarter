import SwiftUI
import Combine

class CardImageViewModel: ObservableObject {
    
    @Published var image: UIImage? = nil
    @Published var isLoading: Bool = false
    
    private let card: Card
    private let dataService: CardImageService
    private var cancellables = Set<AnyCancellable>()
    
    init(card: Card) {
        self.card = card
        self.dataService = CardImageService(card: card)
        self.addSubscribers()
        self.isLoading = true
    }
    
    private func addSubscribers() {
        dataService.$image
            .sink { [weak self] (_) in
                self?.isLoading = false
            } receiveValue: { [weak self] (returnedImage) in
                self?.image = returnedImage
            }
            .store(in: &cancellables)
    }
}
