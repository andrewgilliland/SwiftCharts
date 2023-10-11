import Charts
import SwiftUI

struct ChartLegendPositionPicker: View {
    @Binding var chartLegendPosition: AnnotationPosition

    var body: some View {
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
    }
}
