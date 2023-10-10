import SwiftUI
import Charts

struct WeatherDataView: View {
    @State private var day = "Mon"
    @State private var weatherData: [WeatherData] = WeatherData.defaultWeatherTypeOne
    
    var body: some View {
        Text("Weather")
    }
}

struct WeatherDataView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherDataView()
    }
}
