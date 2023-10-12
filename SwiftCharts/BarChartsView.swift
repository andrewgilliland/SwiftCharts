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
                    .annotation(
                        position: .top,
                        spacing: 0,
                        overflowResolution: .init(x: .disabled, y: .disabled)
                    ) {
//                        if let count = shapes
                        ChartPopOverView(10)
                    }
            }
        }
        .chartXSelection(value: $barSelection)
        .aspectRatio(1, contentMode: .fit)
        .padding()
    }

    @ViewBuilder
    func ChartPopOverView(_ count: Double) -> some View {
        
        VStack(alignment: .leading, spacing: 6) {
            Text("Total Count")
                .padding(.top)
                .padding(.horizontal)

            HStack {
                Text("\(count)")
                    .font(.title3)
                    .fontWeight(.semibold)
            }
            .padding()
        }
        .background(.gray)
        .cornerRadius(8)
    }
}

struct BarChartsView_Previews: PreviewProvider {
    static var previews: some View {
        BarChartsView()
    }
}
