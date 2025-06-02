import Foundation
import Combine

final class CardsViewModel: ObservableObject {
    
    @Published var allCards: [Card] = []
    @Published var searchText = ""
    @Published var maxAnnualFee = 1000.00
    @Published var showBusinessCards = true
    
    private let cardDataService = CardDataService()
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        setupSubscribers()
    }
    
    var filteredCards: [Card] {
        allCards
            .filter { card in
                // Search by name or issuer
                (searchText.isEmpty ||
                 card.name.localizedCaseInsensitiveContains(searchText) ||
                 card.issuer.display.localizedCaseInsensitiveContains(searchText))
                &&
                // Filter by annual fee
                card.annualFee <= maxAnnualFee
                &&
                // Filter by business/personal
                (showBusinessCards || !card.isBusiness)
            }
            .sorted { ($0.bestOffer?.value ?? 0) > ($1.bestOffer?.value ?? 0) }
    }
    
    private func setupSubscribers() {
        cardDataService.$allCards
            .sink { [weak self] (returnedCards) in
                self?.allCards = returnedCards
            }
            .store(in: &cancellables)
    }
    
}
