import SwiftUI

struct DisplaySettingsView: View {
    
    @EnvironmentObject private var theme: ThemeManager
    
    var body: some View {
        NavigationStack {
            List {
                Section("Appearance") {
                    Picker("Appearance", selection: $theme.colorSchemeOption) {
                        ForEach(ColorSchemeOption.allCases, id: \.self) { option in
                            Text(option.rawValue)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                .listRowBackground(Color.clear)
                
                Section("Themes") {
                    ThemeSelectionButton(themeType: MainTheme(), label: "Main")
                    ThemeSelectionButton(themeType: BlackWhiteTheme(), label: "Black & White")
                }
                .listRowBackground(theme.secondaryBackgroundColor)
            }
            .background(theme.primaryBackgroundColor)
            .scrollContentBackground(.hidden)
            .navigationTitle("Display Settings")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    DisplaySettingsView()
        .environmentObject(ThemeManager())
}

struct ThemeSelectionButton<T: ThemeProtocol>: View {
    @EnvironmentObject private var themeManager: ThemeManager
    let themeType: T
    let label: String
    
    var body: some View {
        Button {
            themeManager.setTheme(themeType)
        } label: {
            HStack {
                Text(label)
                    .foregroundStyle(themeManager.labelColor)
                Spacer()
                if themeManager.selectedTheme is T {
                    Image(systemName: "checkmark")
                        .foregroundStyle(themeManager.tintColor)
                }
            }
        }
    }
}