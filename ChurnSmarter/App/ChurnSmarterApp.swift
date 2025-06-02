import SwiftUI

@main
struct ChurnSmarterApp: App {
    
    @StateObject private var theme = ThemeManager()
    
    var body: some Scene {
        WindowGroup {
            CardsView()
                .environmentObject(theme)
                .tint(theme.tintColor)
        }
    }
}
