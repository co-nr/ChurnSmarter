import SwiftUI

struct SettingsView: View {
    
    @EnvironmentObject private var theme: ThemeManager
    
    let invite = URL(string: "https://apps.apple.com/us/app/churn-smarter/id6737769347")!
    let rating = URL(string: "https://apps.apple.com/app/id6737769347?action=write-review")!
    let github = URL(string: "https://github.com/co-nr/ChurnSmarter")!
    
    var body: some View {
        NavigationStack {
            List {
                about
                app
            }
            .applyThemedList(title: "Settings")
            .toolbar { CloseToolbarItem() }
        }
    }
}

#Preview {
    PreviewWrapper {
        SettingsView()
    }
}

private extension SettingsView {
    
    var about: some View {
        Section("About") {
            VStack(alignment: .leading, spacing: 10) {
                Text("This project is an open source tool for comparing current and historical credit card offers.")
                Text("Offers are sorted by their estimated net value, excluding credits.")
            }
        }
        .listRowBackground(theme.secondaryBackgroundColor)
    }
    
    var app: some View {
        Section("App") {
            NavigationLink(destination: DisplaySettingsView()) { Label("Display Settings", systemImage: "paintpalette") }
            Button("Rate Churn Smarter", systemImage: "star") { UIApplication.shared.open(rating) }
            ShareLink("Invite Friends", item: invite)
            Link(destination: github) { Label("GitHub Repository", systemImage: "link") }
        }
        .listRowBackground(theme.secondaryBackgroundColor)
        .buttonStyle(.plain)
    }
}
