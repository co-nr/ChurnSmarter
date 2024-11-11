import SwiftUI

struct SettingsView: View {
    
    @EnvironmentObject private var theme: ThemeManager
    
    var body: some View {
        NavigationStack {
            List {
                Section {
                    NavigationLink(destination: DisplaySettingsView()) { Label("Display Settings", systemImage: "paintpalette") }
                }
                .listRowBackground(theme.secondaryBackgroundColor)
            }
            .background(theme.primaryBackgroundColor)
            .scrollContentBackground(.hidden)
            .navigationTitle("Settings")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar { CloseToolbarItem() }
        }
        .tint(theme.tintColor)
    }
}

#Preview {
    SettingsView()
        .environmentObject(ThemeManager())
}
