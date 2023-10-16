
import Foundation

struct AppDownload: Identifiable {
    var id: UUID = .init()
    var date: Date
    var downloads: Double

    var month: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM"
        return dateFormatter.string(from: date)
    }

    static var defaultAppDownloadsTwentyTwo: [AppDownload] = [
        .init(date: .createDate(1, 1, 2022), downloads: 1500),
        .init(date: .createDate(1, 2, 2022), downloads: 2500),
        .init(date: .createDate(1, 3, 2022), downloads: 500),
        .init(date: .createDate(1, 4, 2022), downloads: 8500),
        .init(date: .createDate(1, 5, 2022), downloads: 950),
        .init(date: .createDate(1, 6, 2022), downloads: 4100),
    ]

    static var defaultAppDownloadsTwentyThree: [AppDownload] = [
        .init(date: .createDate(1, 1, 2023), downloads: 2500),
        .init(date: .createDate(1, 2, 2023), downloads: 3500),
        .init(date: .createDate(1, 3, 2023), downloads: 1500),
        .init(date: .createDate(1, 4, 2023), downloads: 9500),
        .init(date: .createDate(1, 5, 2023), downloads: 1950),
        .init(date: .createDate(1, 6, 2023), downloads: 5100),
    ]
}

extension [AppDownload] {
    func findDownloads(_ on: String) -> Double? {
        if let download = first(where: {
            $0.month == on
        }) {
            return download.downloads
        }

        return nil
    }

    func index(_ on: String) -> Int {
        if let index = firstIndex(where: {
            $0.month == on
        }) {
            return index
        }

        return 0
    }
}

extension Date {
    static func createDate(_ day: Int, _ month: Int, _ year: Int) -> Date {
        var components = DateComponents()
        components.day = day
        components.month = month
        components.year = year

        let calendar = Calendar.current
        let date = calendar.date(from: components) ?? .init()

        return date
    }
}
