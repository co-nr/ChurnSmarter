import SwiftUI

@main
struct ChurnSmarterApp: App {
    
    @EnvironmentObject private var theme: ThemeManager
    
    var body: some Scene {
        WindowGroup {
            OffersView()
                .environmentObject(ThemeManager())
        }
    }
}
