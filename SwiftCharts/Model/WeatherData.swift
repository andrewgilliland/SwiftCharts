

struct WeatherData {
    var day: String
    var time: Int
    var temperature: Int
    var weatherType: String

    static var defaultWeatherTypeOne: [WeatherData] {
        [
            WeatherData(day: "Mon", time: 0600, temperature: 65, weatherType: "sunny"),
            WeatherData(day: "Mon", time: 0630, temperature: 66, weatherType: "sunny"),
            WeatherData(day: "Mon", time: 0700, temperature: 67, weatherType: "sunny"),
            WeatherData(day: "Mon", time: 0730, temperature: 68, weatherType: "sunny"),
        ]
    }

    static var defaultWeatherTypeTwo: [WeatherData] {
        [
            WeatherData(day: "Tue", time: 0600, temperature: 59, weatherType: "cloudy"),
            WeatherData(day: "Tue", time: 0630, temperature: 58, weatherType: "cloudy.rainy"),
            WeatherData(day: "Tue", time: 0700, temperature: 58, weatherType: "cloudy.rainy"),
            WeatherData(day: "Tue", time: 0730, temperature: 57, weatherType: "cloudy.rainy"),
        ]
    }
}
