import SwiftUI



struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                
                NavigationLink("Static Chart View") {
                    StaticChartView()
                }
                
                NavigationLink("Dynamic Chart View") {
                    DynamicChartView()
                }
                
            }.navigationTitle("Swift Charts")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
