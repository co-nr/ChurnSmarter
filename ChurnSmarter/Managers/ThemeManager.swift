import SwiftUI

enum ColorSchemeOption: String, CaseIterable {
    case system = "System"
    case light = "Light"
    case dark = "Dark"
}

protocol ThemeProtocol {
    var tintColor: Color { get }
    var primaryBackgroundColor: Color { get }
    var secondaryBackgroundColor: Color { get }
    var labelColor: Color { get }
}

class ThemeManager: ObservableObject {
    @AppStorage("selectedTheme") private var storedTheme: String = "MainTheme"
    @AppStorage("colorSchemeOption") private var storedColorScheme: String = "system"
    
    @Published var selectedTheme: ThemeProtocol = MainTheme() {
        didSet {
            storedTheme = themeIdentifier(for: selectedTheme)
        }
    }
    
    @Published var colorSchemeOption: ColorSchemeOption = .system {
        didSet {
            storedColorScheme = colorSchemeOption.rawValue
            applyColorScheme()
        }
    }
    
    var tintColor: Color { selectedTheme.tintColor }
    var primaryBackgroundColor: Color { selectedTheme.primaryBackgroundColor }
    var secondaryBackgroundColor: Color { selectedTheme.secondaryBackgroundColor }
    var labelColor: Color { selectedTheme.labelColor }
    
    init() {
        selectedTheme = themeForIdentifier(storedTheme)
        colorSchemeOption = ColorSchemeOption(rawValue: storedColorScheme) ?? .system
        applyColorScheme()
    }
    
    func setTheme(_ theme: ThemeProtocol) {
        selectedTheme = theme
    }
    
    private func applyColorScheme() {
        let style: UIUserInterfaceStyle
        switch colorSchemeOption {
        case .system: style = .unspecified
        case .light: style = .light
        case .dark: style = .dark
        }
        
        UIApplication.shared.connectedScenes
            .compactMap { $0 as? UIWindowScene }
            .first?
            .windows
            .forEach { $0.overrideUserInterfaceStyle = style }
    }
    
    private func themeIdentifier(for theme: ThemeProtocol) -> String {
        switch theme {
        case is MainTheme: return "MainTheme"
        case is DreamTheme: return "DreamTheme"
        default: return "MainTheme"
        }
    }
    
    private func themeForIdentifier(_ identifier: String) -> ThemeProtocol {
        switch identifier {
        case "MainTheme": return MainTheme()
        case "DreamTheme": return DreamTheme()
        default: return MainTheme()
        }
    }
}
