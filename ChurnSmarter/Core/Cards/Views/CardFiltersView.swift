import SwiftUI

struct CardFiltersView: View {
    
    @EnvironmentObject private var viewModel: CardsViewModel
    @EnvironmentObject private var theme: ThemeManager
    
    var body: some View {
        NavigationStack {
            List {
                Section("Max Annual Fee") {
                    HStack {
                        Text("$\(Int(viewModel.maxAnnualFee))")
                        Spacer()
                        Slider(value: $viewModel.maxAnnualFee, in: 0...1000, step: 50)
                    }
                }
                .listRowBackground(theme.secondaryBackgroundColor)
                
                Section {
                    Toggle("Show Business Cards", isOn: $viewModel.showBusinessCards)
                }
                .listRowBackground(theme.secondaryBackgroundColor)
            }
            .applyThemedList(title: "Filters")
            .toolbar { CloseToolbarItem() }
        }
    }
}

#Preview {
    PreviewWrapper {
        CardFiltersView()
            .environmentObject(CardsViewModel())
    }
}
