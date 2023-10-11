import Charts
import SwiftUI

struct PieChartView: View {
    @Binding var graphType: GraphType
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
            .animation(.snappy, value: graphType)

            Stepper("Corner Radius: \(String(format: "%.1f", cornerRadius))", value: $cornerRadius, in: 0 ... 50)
                .padding(.horizontal)
            Stepper("Angular Inset: \(String(format: "%.1f", angularInset))", value: $angularInset, in: 0 ... 10, step: 0.1)
                .padding(.horizontal)
            Stepper("Chart Legend Spacing: \(String(format: "%.1f", chartLegendSpacing))", value: $chartLegendSpacing, in: 0 ... 50, step: 0.5)
                .padding(.horizontal)

            Text("Chart Legend Position")
                .padding(.top)
            Picker("", selection: $chartLegendPosition) {
                Text("Top")
                    .tag(AnnotationPosition.top)

                Text("Bottom")
                    .tag(AnnotationPosition.bottom)

                Text("Trailing")
                    .tag(AnnotationPosition.trailing)

                Text("Leading")
                    .tag(AnnotationPosition.leading)

                Text("Overlay")
                    .tag(AnnotationPosition.overlay)
            }
            .pickerStyle(.segmented)
            .padding(.horizontal)

            Text("Chart Legend Aligment")
                .padding(.top)
            Picker("Chart Legend Alignment", selection: $chartLegendAlignment) {
                Text("Center")
                    .tag(Alignment.center)
                Text("Top")
                    .tag(Alignment.top)

                Text("Bottom")
                    .tag(Alignment.bottom)

                Text("Trailing")
                    .tag(Alignment.trailing)

                Text("Leading")
                    .tag(Alignment.leading)
            }
            .pickerStyle(.segmented)
            .padding(.horizontal)
        }
        .padding()
    }
}
