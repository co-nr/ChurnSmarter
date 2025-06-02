import SwiftUI

struct CardsToolbar: ToolbarContent {
    
    @Binding var isShowingFilters: Bool
    @Binding var isShowingSettings: Bool
    
    var body: some ToolbarContent {
        
        ToolbarItem(placement: .topBarTrailing) {
            Button {
                isShowingFilters.toggle()
            } label: {
                Image(systemName: "line.3.horizontal.decrease.circle")
            }
        }
        
        ToolbarItem(placement: .topBarLeading) {
            Button {
                isShowingSettings.toggle()
            } label: {
                Image(systemName: "gear")
            }
        }
        
    }
}
