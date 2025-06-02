import SwiftUI

struct PreviewWrapper<V: View>: View {
    
    var content: () -> V
    private let theme = ThemeManager()

    var body: some View {
        content()
            .environmentObject(theme)
            .tint(theme.tintColor)
    }
}

