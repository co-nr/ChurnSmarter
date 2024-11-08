import Foundation
import Combine

final class CardDataService {
    
    @Published var allCards: [Card] = []
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        fetchCards()
    }
    
    private func fetchCards() {
        guard let url = URL(string: "https://raw.githubusercontent.com/andenacitelli/credit-card-bonuses-api/main/exports/data.json") else { return }
        
        NetworkingManager.download(url: url)
            .decode(type: [Card].self, decoder: JSONDecoder())
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] returnedCards in
                self?.allCards = returnedCards
            })
            .store(in: &cancellables)
    }
}
