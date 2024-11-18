import SwiftUI

struct OfferFiltersView: View {
    
    @EnvironmentObject private var theme: ThemeManager
    @EnvironmentObject var viewModel: OffersViewModel
    
    var body: some View {
        NavigationStack {
            Form {
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
            .background(theme.primaryBackgroundColor)
            .scrollContentBackground(.hidden)
            .navigationTitle("Filters")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar { CloseToolbarItem() }
        }
        .tint(theme.tintColor)
    }
}

#Preview {
    OfferFiltersView()
        .environmentObject(ThemeManager())
        .environmentObject(OffersViewModel())
}
