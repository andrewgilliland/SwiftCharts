import Charts
import UIKit

enum PancakeCakeFlavor: String, Plottable {
    case cachapa = "Cachapa"
    case injera = "Injera"
    case crepe = "Crepe"
    case jianBing = "Jian Bing"
    case dosa = "Dosa"
    case american = "American"
}

struct Pancake {
    let flavor: PancakeCakeFlavor
    let sales: Int

    static var defaultPancakes = [Pancake(flavor: .american, sales: 15000),
                                  Pancake(flavor: .cachapa, sales: 12000),
                                  Pancake(flavor: .crepe, sales: 10000),
                                  Pancake(flavor: .dosa, sales: 8000),
                                  Pancake(flavor: .injera, sales: 6000),
                                  Pancake(flavor: .jianBing, sales: 4000)]

    var flavorString: String {
        return flavor.rawValue
    }

    static func flavorOfPancakeWithHighestSales() -> String? {
        if let pancakeWithHighestSales = defaultPancakes.max(by: { $0.sales < $1.sales }) {
            return pancakeWithHighestSales.flavorString
        }
        return nil
    }
}
