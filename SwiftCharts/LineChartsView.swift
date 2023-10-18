import Charts
import SwiftUI

struct LineChartsView: View {
    var body: some View {
        Chart {
            ForEach(AppDownload.defaultAppDownloadsTwentyThree.sorted(by: { $1.downloads > $0.downloads })) { appDownload in
                LineMark(x: .value("Month", appDownload.month), y: .value("Downloads", appDownload.downloads))
                    .foregroundStyle(.purple)
            }
        }
    }
}

#Preview {
    LineChartsView()
}
