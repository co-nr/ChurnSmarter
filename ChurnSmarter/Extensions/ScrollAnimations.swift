import SwiftUI

extension View {
    @ViewBuilder
    func applyScrollAnimations() -> some View {
        if #available(iOS 17, *) {
            self.scrollTransition(.animated.threshold(.visible(0.1))) { content, phase in
                content
                    .opacity(phase.isIdentity ? 1 : 0)
                    .scaleEffect(phase.isIdentity ? 1 : 0.80)
            }
        } else {
            self
        }
    }
}
