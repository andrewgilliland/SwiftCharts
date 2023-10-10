import Charts
import SwiftUI

struct BarChartsView: View {
    var body: some View {
        Chart {
            ForEach(ToyShape.defaultToyData) { shape in
                BarMark(x: .value("Shape Type", shape.type), y: .value("Total Count", shape.count))
            }
        }
        .aspectRatio(1, contentMode: .fit)
        .padding()
    }
}

struct BarChartsView_Previews: PreviewProvider {
    static var previews: some View {
        BarChartsView()
    }
}
