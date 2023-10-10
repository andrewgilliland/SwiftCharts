import SwiftUI

//  https://github.com/jordibruin/Swift-Charts-Examples


struct ContentView: View {
    var body: some View {
        NavigationView {

                    VStack {
                    
                        List {
                            Section(header: Text("Chart by Type")) {
                                NavigationLink("Bar Charts") {
                                    BarChartsView()
                                }
                                
                                NavigationLink("Static Chart View") {
                                    StaticChartView()
                                }
                                
                                NavigationLink("Dynamic Chart View") {
                                    DynamicChartView()
                                }
                                
                                NavigationLink("Weather Data View") {
                                    WeatherDataView()
                                }
                            }
                        }
//                        .listStyle(GroupedListStyle())
                        
                        List {
                            Section(header: Text("Charts by Style")) {
                                                        Text("Item A")
                                                        Text("Item B")
                                                        Text("Item C")
                                                    }
                        }
//                        .listStyle(GroupedListStyle())
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
