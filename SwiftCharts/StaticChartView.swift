
//  Introduction to SwiftCharts: Creating Charts and Graphs in SwiftUI
//  https://www.youtube.com/watch?v=mnH7YRmuVKw

import Charts
import SwiftUI

struct StaticChartView: View {
    @State private var radIsShown = false

    var body: some View {
        VStack {
            Chart {
                BarMark(x: .value("Name", "Mike"), y: .value("Cool", 3))
                    .foregroundStyle(.orange)
                BarMark(x: .value("Name", "Leo"), y: .value("Cool", 2))
                BarMark(x: .value("Name", "Raph"), y: .value("Cool", 1))
                    .foregroundStyle(.red)
                BarMark(x: .value("Name", "Don"), y: .value("Cool", 3))
                    .foregroundStyle(.indigo)

                if radIsShown {
                    RuleMark(y: .value("Average", 1.5))
                        .foregroundStyle(.green)
                        .annotation(position: .top) {
                            Text("Rad!!!")
                                .foregroundColor(.green)
                                .fontWeight(.bold)
                                .font(.title)
                        }
                }
            }
            .aspectRatio(1, contentMode: .fit)
            .padding()

            Toggle(radIsShown ? "show rad" : "hide rad", isOn: $radIsShown.animation(.easeInOut(duration: 0.5)))
        }
    }
}

struct IntroView_Previews: PreviewProvider {
    static var previews: some View {
        StaticChartView()
    }
}
