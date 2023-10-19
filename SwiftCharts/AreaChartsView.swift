import Charts
import SwiftUI

struct AreaChartsView: View {
    var body: some View {
        Chart(AppDownload.defaultAppDownloadsTwentyThree) { point in
            AreaMark(x: .value("Month", point.month), y: .value("Downloads", point.downloads), stacking: .center)
        }
        .chartForegroundStyleScale(
            range: Gradient(colors: [.purple, .blue.opacity(0.3)])
        )
        .aspectRatio(1, contentMode: .fit)
        .padding()
    }
}

#Preview {
    AreaChartsView()
}
