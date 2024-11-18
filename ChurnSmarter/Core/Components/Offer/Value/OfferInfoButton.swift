import SwiftUI

struct InfoButton: View {
    @Binding var isShowingOfferValue: Bool
    
    var body: some View {
        Button {
            isShowingOfferValue.toggle()
        } label: {
            Image(systemName: "info.circle")
                .font(.footnote)
                .foregroundStyle(.secondary)
        }
    }
}
