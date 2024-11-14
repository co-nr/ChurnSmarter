import SwiftUI

public struct CloseToolbarItem: ToolbarContent {
    
    @EnvironmentObject private var theme: ThemeManager
    @Environment(\.dismiss) private var dismiss
    
    public init() {}
    
    public var body: some ToolbarContent {
        ToolbarItem(placement: .navigationBarLeading) {
            Button(action: {
                dismiss()
            }, label: {
                Image(systemName: "xmark")
                    .font(.caption)
                    .padding(7)
                    .background(Circle().fill(theme.secondaryBackgroundColor))
            })
            .padding(4)
            .keyboardShortcut(.cancelAction)
        }
    }
}
