import Foundation

struct ToyShape: Identifiable {
    var type: String
    var count: Int
    var id = UUID()

    static var defaultToyData: [ToyShape] = [
        .init(type: "Cube", count: 5),
        .init(type: "Sphere", count: 4),
        .init(type: "Cone", count: 3),
        .init(type: "Prism", count: 2),
        .init(type: "Pyramid", count: 4),
    ]
}
