import Foundation

struct ToyShape: Identifiable {
    var type: String
    var count: Double
    var id = UUID()
    
    static var defaultToyData: [ToyShape] = [
        .init(type: "Cube", count: 5),
            .init(type: "Sphere", count: 4),
            .init(type: "Pyramid", count: 4)
    
    ]
}
