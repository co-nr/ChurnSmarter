import SwiftUI

struct MainTheme: ThemeProtocol {
    var tintColor: Color { return Color("MainTintColor") }
    var primaryBackgroundColor: Color { return Color("MainPrimaryBackgroundColor") }
    var secondaryBackgroundColor: Color { return Color("MainSecondaryBackgroundColor") }
    var labelColor: Color { return Color("MainLabelColor") }
}

struct DreamTheme: ThemeProtocol {
    var tintColor: Color { return Color("DreamTintColor") }
    var primaryBackgroundColor: Color { return Color("DreamPrimaryBackgroundColor") }
    var secondaryBackgroundColor: Color { return Color("DreamSecondaryBackgroundColor") }
    var labelColor: Color { return Color("DreamLabelColor") }
}
