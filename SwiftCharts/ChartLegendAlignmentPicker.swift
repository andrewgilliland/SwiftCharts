import SwiftUI

struct ChartLegendAlignmentPicker: View {
    @Binding var chartLegendAlignment: Alignment

    var body: some View {
        Text("Chart Legend Aligment")
            .padding(.top)
        Picker("", selection: $chartLegendAlignment) {
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
}
