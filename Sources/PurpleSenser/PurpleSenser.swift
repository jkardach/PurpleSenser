
import Foundation

public struct PurpleSensor: Decodable {
    public struct Sensor: Decodable {
        public struct Stats: Decodable {
            public let pm25: Double
            public let pm25_10minute: Double
            public let pm25_30minute: Double
            public let pm25_60minute: Double
            public let pm25_6hour: Double
            public let pm25_24hour: Double
            public let pm25_1week: Double
            public let time_stamp: Int

            public enum CodingKeys: String, CodingKey {
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
        public let sensor_index: Int
        public let last_modified: Int
        public let name: String
        public let icon: Int
        public let humidity: Double
        public let temperature: Double
        public let pressure: Double
        public let stats: Stats
    }
    public let api_version: String
    public let time_stamp: Int
    public let data_time_stamp: Int
    public let sensor: Sensor
}
