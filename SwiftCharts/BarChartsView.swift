import Charts
import SwiftUI

struct BarChartsView: View {
    @State private var barSelection: String?

    var body: some View {
        Chart {
            ForEach(ToyShape.defaultToyData) { shape in
                BarMark(x: .value("Shape Type", shape.type), y: .value("Total Count", shape.count))
                    .foregroundStyle(by: .value("Shape Type", shape.type))
            }

            if let barSelection {
                RuleMark(x: .value("Shape Type", barSelection))
                    .foregroundStyle(.gray.opacity(0.35))
                    .zIndex(-10)
                    .offset(yStart: -10)
            }
        }
        .chartXSelection(value: $barSelection)
        .aspectRatio(1, contentMode: .fit)
        .padding()
    }
}

struct BarChartsView_Previews: PreviewProvider {
    static var previews: some View {
        BarChartsView()
    }
}
