import SwiftUI

public struct CloseToolbarItem: ToolbarContent {
    @Environment(\.dismiss) private var dismiss
    
    public init() {}
    
    public var body: some ToolbarContent {
        ToolbarItem(placement: .navigationBarLeading) {
            Button(action: {
                dismiss()
            }, label: {
                Image(systemName: "xmark")
                    .font(.caption2)
                    .padding(8)
                    .background(Circle().fill(.thinMaterial))
            })
            .padding(4)
            .keyboardShortcut(.cancelAction)
        }
    }
}
