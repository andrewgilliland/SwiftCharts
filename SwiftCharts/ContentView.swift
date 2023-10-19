import SwiftUI

//  https://github.com/jordibruin/Swift-Charts-Examples

// https://www.youtube.com/watch?v=nu74-aRobSs - SwiftUI Interactive Charts - Pie/Donut Charts - iOS 17 - WWDC 2023
// https://developer.apple.com/videos/play/wwdc2023/10037/ ios 17
// https://nilcoalescing.com/blog/BuildAndStyleAChartWithSwiftChartsFramework/

// 1. barchart
// 2. linechart
// 3. areachart
// 4. scatterplot
// 5. heat map
// 6. pie chart

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                List {
                    Section(header: Text("Chart by Type")) {
                        NavigationLink("Bar Charts") {
                            BarChartsView()
                        }

                        NavigationLink("Line Charts") {
                            LineChartsView()
                        }

                        NavigationLink("Area Charts") {
                            AreaChartsView()
                        }

                        NavigationLink("Pie Charts") {
                            PieChartsView()
                        }

//                                NavigationLink("Static Chart View") {
//                                    StaticChartView()
//                                }

//                                NavigationLink("Dynamic Chart View") {
//                                    DynamicChartView()
//                                }

//                                NavigationLink("Weather Data View") {
//                                    WeatherDataView()
//                                }
                    }
                }
            }
            .navigationTitle("Swift Charts")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
