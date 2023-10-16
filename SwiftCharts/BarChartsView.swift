import Charts
import SwiftUI

struct BarChartsView: View {
    @State private var barSelection: String?
    @State private var year: Int = 2022

    var body: some View {
        VStack {
            Picker("", selection: $year) {
                Text("Unsorted")
                    .tag(2022)

                Text("Sorted")
                    .tag(2023)
            }
            .pickerStyle(.segmented)
            .labelsHidden()
            .padding()

            Chart {
                ForEach(year == 2022 ? AppDownload.defaultAppDownloadsTwentyThree : AppDownload.defaultAppDownloadsTwentyThree.sorted(by: { $0.downloads > $1.downloads })) { appDownload in
                    BarMark(x: .value("Month", appDownload.month), y: .value("Downloads", appDownload.downloads))
                        .foregroundStyle(by: .value("Month", appDownload.month))
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
            .chartXSelection(value: $barSelection)
            .aspectRatio(1, contentMode: .fit)
            .padding()
            .animation(.bouncy, value: year)
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
