import Charts
import SwiftUI

struct DonutChartView: View {
    @State private var cornerRadius = 2
    @State private var angularInset = 1.0

    var body: some View {
        VStack {
            Chart(Pancake.defaultPancakes, id: \.flavor) { pancake in
                SectorMark(
                    angle: .value("Sales", pancake.sales),
                    innerRadius: .ratio(0.618),
                    angularInset: angularInset
                )
                .cornerRadius(CGFloat(cornerRadius))
                .foregroundStyle(by: .value("Flavor", pancake.flavor))
            }
            .chartXAxis(.hidden)
            .aspectRatio(contentMode: .fit)
            .padding()
            .chartBackground { chartProxy in
                GeometryReader { geometry in
                    let frame = geometry[chartProxy.plotAreaFrame]
                    VStack {
                        Text("Most Sold Style")
                            .fontWeight(.light)
                            .font(.subheadline)
                            .foregroundStyle(.gray)

                        Text(Pancake.flavorOfPancakeWithHighestSales() ?? "Sweet")
                            .fontWeight(.bold)
                            .font(.title2)
                    }
                    .position(x: frame.midX, y: frame.midY)
                }
            }

            Stepper("Corner Radius: \(cornerRadius)", value: $cornerRadius, in: 0 ... 50)
                .padding(.horizontal)
            Stepper("Angular Inset: \(angularInset)", value: $angularInset, in: 0 ... 10, step: 0.1)
                .padding(.horizontal)
        }
        .padding()
    }
}

#Preview {
    DonutChartView()
}
