import SwiftUI

struct ThemedListModifier: ViewModifier {
    
    @EnvironmentObject private var theme: ThemeManager
    let title: String
    
    func body(content: Content) -> some View {
        content
            .background(theme.primaryBackgroundColor)
            .scrollContentBackground(.hidden)
            .navigationTitle(title)
            .navigationBarTitleDisplayMode(.inline)
    }
}

extension View {
    func applyThemedList(title: String) -> some View {
        self.modifier(ThemedListModifier(title: title))
    }
}
