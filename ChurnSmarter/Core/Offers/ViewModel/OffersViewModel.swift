import Combine
import Foundation

final class OffersViewModel: ObservableObject {
    
    @Published var allCards: [Card] = []
    @Published var searchText: String = ""
    @Published var maxAnnualFee: Double = 1000
    @Published var showBusinessCards: Bool = true
    
    private let cardDataService = CardDataService()
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        setupSubscribers()
    }
    
    var filteredCards: [Card] {
        allCards
            .filter { card in
                (showBusinessCards || !(card.isBusiness)) &&
                card.annualFee <= Int(maxAnnualFee) &&
                (searchText.isEmpty ||
                 card.name.display.localizedCaseInsensitiveContains(searchText) ||
                 card.issuer.display.localizedCaseInsensitiveContains(searchText))
            }
            .sorted { highestOfferValue(for: $0) > highestOfferValue(for: $1) }
    }
    
    private func highestOfferValue(for card: Card) -> Double {
        let calculator = OfferCalculator(card: card)
        return card.offers.map { calculator.offerValue(for: $0) }.max() ?? 0
    }
    
    private func setupSubscribers() {
        cardDataService.$allCards
            .sink { [weak self] (returnedCards) in
                self?.allCards = returnedCards
            }
            .store(in: &cancellables)
    }
}
