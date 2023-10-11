import Charts
import SwiftUI

struct PieChartView: View {
    @State private var cornerRadius: CGFloat = 2.0
    @State private var angularInset = 1.0
    @State private var chartLegendSpacing: CGFloat = 25.0
    @State private var chartLegendAlignment: Alignment = .center
    @State private var chartLegendPosition: AnnotationPosition = .bottom

    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text("Most Sold Style")
                        .fontWeight(.light)
                        .font(.subheadline)
                        .foregroundStyle(.gray)

                    Text(Pancake.flavorOfPancakeWithHighestSales() ?? "Sweet")
                        .fontWeight(.bold)
                        .font(.title2)
                }
                .padding()

                Spacer()
            }

            Chart(Pancake.defaultPancakes, id: \.flavor) { pancake in
                SectorMark(
                    angle: .value("Sales", pancake.sales),
                    angularInset: angularInset
                )
                .cornerRadius(cornerRadius)
                .foregroundStyle(by: .value("Flavor", pancake.flavor))
            }
            .chartLegend(position: chartLegendPosition, alignment: chartLegendAlignment, spacing: chartLegendSpacing)
            .chartXAxis(.hidden)
            .aspectRatio(contentMode: .fit)
            .padding()

            Stepper("Corner Radius: \(cornerRadius)", value: $cornerRadius, in: 0 ... 50)
                .padding(.horizontal)
            Stepper("Angular Inset: \(angularInset)", value: $angularInset, in: 0 ... 10, step: 0.1)
                .padding(.horizontal)
            Stepper("Chart Legend Spacing: \(chartLegendSpacing)", value: $chartLegendSpacing, in: 0 ... 50, step: 0.5)
                .padding(.horizontal)

//            Picker("Chart Legend Position", selection: $chartLegendPosition) {
//                Text("Top")
//                    .tag(AnnotationPosition.top)
//
//                Text("Bottom")
//                    .tag(AnnotationPosition.bottom)
//
//                Text("Trailing")
//                    .tag(AnnotationPosition.trailing)
//
//                Text("Leading")
//                    .tag(AnnotationPosition.leading)
//            }

            Picker("Chart Legend Alignment", selection: $chartLegendAlignment) {
                Text("Center")
                    .tag(Alignment.center)

                Text("Bottom")
                    .tag(Alignment.bottom)

                Text("Trailing")
                    .tag(Alignment.trailing)

                Text("Leading")
                    .tag(Alignment.leading)
            }
            .pickerStyle(.segmented)
            .labelsHidden()
            .padding()
        }
        .padding()
    }
}

#Preview {
    PieChartView()
}

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



