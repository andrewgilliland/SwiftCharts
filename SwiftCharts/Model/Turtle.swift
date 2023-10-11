import SwiftUI

struct Turtle: Identifiable, Equatable {
    let name: String
    let cool: Double
    let color: Color
    let height: Double

    var id: String { return name }
}
