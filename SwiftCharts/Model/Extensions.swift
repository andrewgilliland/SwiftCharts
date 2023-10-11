import Charts
import SwiftUI

extension Alignment: Hashable {
    public func hash(into hasher: inout Hasher) {
        switch self {
        case .leading:
            hasher.combine("leading")
        case .leadingFirstTextBaseline:
            hasher.combine("leadingFirstTextBaseline")
        case .leadingLastTextBaseline:
            hasher.combine("leadingLastTextBaseline")

        case .center:
            hasher.combine("center")
        case .centerFirstTextBaseline:
            hasher.combine("centerFirstTextBaseline")
        case .centerLastTextBaseline:
            hasher.combine("centerLastTextBaseline")

        case .trailing:
            hasher.combine("trailing")
        case .trailingLastTextBaseline:
            hasher.combine("trailingLastTextBaseline")
        case .trailingLastTextBaseline:
            hasher.combine("trailingLastTextBaseline")

        case .top:
            hasher.combine("top")
        case .topLeading:
            hasher.combine("topLeading")
        case .topTrailing:
            hasher.combine("topTrailing")

        case .bottom:
            hasher.combine("bottom")
        case .bottomLeading:
            hasher.combine("bottomLeading")
        case .bottomTrailing:
            hasher.combine("bottomTrailing")

        default:
            hasher.combine("default")
        }
    }
}

extension AnnotationPosition: Hashable {
    public func hash(into hasher: inout Hasher) {
        switch self {
        case .overlay:
            hasher.combine("overlay")
        case .leading:
            hasher.combine("leading")
        case .trailing:
            hasher.combine("trailing")

        case .top:
            hasher.combine("top")
        case .topLeading:
            hasher.combine("topLeading")
        case .topTrailing:
            hasher.combine("topTrailing")

        case .bottom:
            hasher.combine("bottom")
        case .bottomLeading:
            hasher.combine("bottomLeading")
        case .bottomTrailing:
            hasher.combine("bottomTrailing")

        default:
            hasher.combine("default")
        }
    }
}
