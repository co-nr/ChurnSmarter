import SwiftUI

struct MainTheme: ThemeProtocol {
    var tintColor: Color { return Color("MainTintColor") }
    var primaryBackgroundColor: Color { return Color("MainPrimaryBackgroundColor") }
    var secondaryBackgroundColor: Color { return Color("MainSecondaryBackgroundColor") }
    var labelColor: Color { return Color("MainLabelColor") }
}

struct BlackWhiteTheme: ThemeProtocol {
    var tintColor: Color { return Color("BlackWhiteTintColor") }
    var primaryBackgroundColor: Color { return Color("BlackWhitePrimaryBackgroundColor") }
    var secondaryBackgroundColor: Color { return Color("BlackWhiteSecondaryBackgroundColor") }
    var labelColor: Color { return Color("BlackWhiteLabelColor") }
}
