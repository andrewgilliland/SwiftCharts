
import SwiftUI

struct PieChartsView: View {
    @State private var graphType: GraphType = .pie

    var body: some View {
        ScrollView {
            VStack {
                Picker("", selection: $graphType) {
                    Text(GraphType.pie.rawValue)
                        .tag(GraphType.pie)

                    Text(GraphType.donut.rawValue)
                        .tag(GraphType.donut)
                }
                .pickerStyle(.segmented)
                .labelsHidden()
                .padding()

                if graphType == .pie {
                    PieChartView(graphType: $graphType)
                }

                if graphType == .donut {
                    DonutChartView()
                }
            }
        }
    }
}

#Preview {
    PieChartsView()
}
