import SwiftUI

struct CardCell: View {
    
    let card: Card
    
    var body: some View {
        VStack(alignment: .leading) {
            CardImageView(card: card)
                .scaledToFit()
                .frame(height: 120)
            
            Text(card.name)
        }
    }
}

//#Preview {
//    CardCell()
//}
