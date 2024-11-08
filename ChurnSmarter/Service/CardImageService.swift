import SwiftUI
import Combine

final class CardImageService {
    
    @Published var image: UIImage? = nil
    
    private var imageSubscription: AnyCancellable?
    private let card: Card
    private let fileManager = LocalFileManager.shared
    private let folderName = "card_images"
    private let imageName: String
    
    init(card: Card) {
        self.card = card
        self.imageName = (card.name + card.issuer).replacingOccurrences(of: "[^a-zA-Z0-9]", with: "_", options: .regularExpression)
        getCardImage()
    }
    
    private func getCardImage() {
        if let savedImage = fileManager.getImage(imageName: imageName, folderName: folderName) {
            image = savedImage
        } else {
            downloadCardImage()
        }
    }
    
    private func downloadCardImage() {
        guard let url = URL(string: card.imageUrlWithPrefix) else {
            print("DEBUG: Invalid URL \(card.imageUrlWithPrefix)")
            return
        }
        imageSubscription = NetworkingManager.download(url: url)
            .tryMap({ (data) -> UIImage? in
                return UIImage(data: data)
            })
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] (returnedImage) in
                guard let self = self, let downloadedImage = returnedImage else { return }
                self.image = downloadedImage
                self.imageSubscription?.cancel()
                self.fileManager.saveImage(image: downloadedImage, imageName: self.imageName, folderName: self.folderName)
            })
    }
}
