
import Charts
import SwiftUI

struct DynamicChartView: View {
    @State private var radIsShown = false

    let turtles = [
        Turtle(name: "Mike", cool: 2.95, color: .orange, height: 1.5),
        Turtle(name: "Leo", cool: 1.95, color: .blue, height: 1.75),
        Turtle(name: "Raph", cool: 1.5, color: .red, height: 2.0),
        Turtle(name: "Don", cool: 2.75, color: .purple, height: 1.6),
    ]
    var maxTurtleCool: Turtle? {
        turtles.max { $0.cool < $1.cool }
    }

    var body: some View {
        VStack {
            Chart {
                ForEach(turtles) { turtle in
                    BarMark(x: .value("Name", turtle.name), y: .value("Cool", turtle.cool))
                        .foregroundStyle(maxTurtleCool == turtle ? turtle.color : .gray)
                        .opacity((maxTurtleCool == turtle) ? 1.0 : 0.5)
                }

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

struct DynamicChartView_Previews: PreviewProvider {
    static var previews: some View {
        DynamicChartView()
    }
}
