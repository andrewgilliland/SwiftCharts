import Charts
import SwiftUI

struct BarChartsView: View {
    @State private var barSelection: String?
    @State private var sorted: Bool = false

    var body: some View {
        VStack {
            Picker("", selection: $sorted) {
                Text("Unsorted")
                    .tag(false)

                Text("Sorted")
                    .tag(true)
            }
            .pickerStyle(.segmented)
            .labelsHidden()
            .padding()

            Chart {
                ForEach(sorted == true ? AppDownload.defaultAppDownloadsTwentyThree.sorted(by: { $0.downloads > $1.downloads }) : AppDownload.defaultAppDownloadsTwentyThree) { appDownload in
                    BarMark(x: .value("Month", appDownload.month), y: .value("Downloads", appDownload.downloads))
                        .foregroundStyle(by: .value("Downloads", appDownload.downloads))
                }

                if let barSelection {
                    RuleMark(x: .value("Shape Type", barSelection))
                        .foregroundStyle(.gray.opacity(0.35))
                        .zIndex(-10)
                        .offset(yStart: -10)
                        .annotation(
                            position: .top,
                            spacing: 0,
                            overflowResolution: .init(x: .fit, y: .disabled)
                        ) {
                            //                        if let count = shapes
                            ChartPopOverView(10)
                        }
                }
            }
            .chartLegend(position: .bottom)
            .chartXSelection(value: $barSelection)
            .aspectRatio(1, contentMode: .fit)
            .padding()
            .animation(.bouncy, value: sorted)
        }
    }

    @ViewBuilder
    func ChartPopOverView(_ count: Int) -> some View {
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
