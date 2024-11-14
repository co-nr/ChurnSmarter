import Foundation
import Combine

final class OffersViewModel: ObservableObject {
    
    @Published var allCards: [Card] = []
    @Published var searchText: String = ""
      
    private let cardDataService = CardDataService()
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        setupSubscribers()
    }
    
    private func setupSubscribers() {
        cardDataService.$allCards
            .sink { [weak self] (returnedCards) in
                self?.allCards = returnedCards
            }
            .store(in: &cancellables)
    }
}
