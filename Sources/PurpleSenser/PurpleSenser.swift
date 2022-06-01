
import Foundation

struct PurpleSensor: Decodable {
    struct Sensor: Decodable {
        struct Stats: Decodable {
            let pm25: Double
            let pm25_10minute: Double
            let pm25_30minute: Double
            let pm25_60minute: Double
            let pm25_6hour: Double
            let pm25_24hour: Double
            let pm25_1week: Double
            let time_stamp: Int

            enum CodingKeys: String, CodingKey {
                case pm25 = "pm2.5"
                case pm25_10minute = "pm2.5_10minute"
                case pm25_30minute = "pm2.5_30minute"
                case pm25_60minute = "pm2.5_60minute"
                case pm25_6hour = "pm2.5_6hour"
                case pm25_24hour = "pm2.5_24hour"
                case pm25_1week = "pm2.5_1week"
                case time_stamp
            }
        }
        let sensor_index: Int
        let last_modified: Int
        let name: String
        let icon: Int
        let humidity: Double
        let temperature: Double
        let pressure: Double
        let stats: Stats
    }
    let api_version: String
    let time_stamp: Int
    let data_time_stamp: Int
    let sensor: Sensor
    
    public var text = "Hello, World!"
}
