import SwiftUI

struct OfferBadge: View {
    enum BadgeType {
        case annualFee(Int)
        case historicalMax(Double)
        
        var text: String {
            switch self {
            case .annualFee(let fee): return "AF: $\(fee)"
            case .historicalMax(let percentage): return "\(Int(percentage))% OF HISTORICAL MAX"
            }
        }
        
        var color: Color {
            switch self {
            case .annualFee(let fee):
                switch fee {
                case 0...99: return .green
                case 100..<200: return .yellow
                default: return .red
                }
            case .historicalMax(let percentage):
                switch percentage {
                case 100...: return .green
                case 50..<100: return .yellow
                default: return .red
                }
            }
        }
    }
    
    let type: BadgeType
    
    var body: some View {
        Text(type.text)
            .font(.caption)
            .fontWeight(.semibold)
            .padding(5)
            .background(type.color.opacity(0.4))
            .cornerRadius(4)
    }
}
