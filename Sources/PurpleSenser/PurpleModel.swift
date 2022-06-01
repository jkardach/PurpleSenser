//
//  PurpleModel.swift
//  
//
//  Created by jim kardach on 5/31/22.
//

import Foundation
import UIKit


@objc public class AqiBasic: NSObject {
    var aqi = "0.0 ug/㎥"
    var aqiD = 0.0
    var concern = "Good"
    var desc = "Air quality is satisfactory, and air polution poses little or no risk"
    var backgroundColor = UIColor.red
    var textColor = UIColor.white
}

public class PurpleModel {
    public var name: String = ""
    public var humidity: String = ""
    public var temp: String = ""
    public var pressure: String = ""
    
    public var pm25: AqiBasic!
    public var pm25_10minute: AqiBasic!
    public var pm25_30minute: AqiBasic!
    public var pm25_60minute: AqiBasic!
    public var pm25_6hour: AqiBasic!
    public var pm25_24hour: AqiBasic!
    public var pm25_1week: AqiBasic!
    
    init(sensor: PurpleSensor) {
        self.name = sensor.sensor.name
        self.humidity = String(format: "%.1f﹪", sensor.sensor.humidity)
        self.temp = String(format: "%.1f°F", sensor.sensor.temperature)
        self.pressure = String(format: "%.1fmbar", sensor.sensor.pressure)
        
        self.pm25 = getAqi(pm25: sensor.sensor.stats.pm25)
        self.pm25_10minute = getAqi(pm25: sensor.sensor.stats.pm25_10minute)
        self.pm25_30minute = getAqi(pm25: sensor.sensor.stats.pm25_30minute)
        self.pm25_60minute = getAqi(pm25: sensor.sensor.stats.pm25_60minute)
        self.pm25_6hour = getAqi(pm25: sensor.sensor.stats.pm25_6hour)
        self.pm25_24hour = getAqi(pm25: sensor.sensor.stats.pm25_24hour)
        self.pm25_1week = getAqi(pm25: sensor.sensor.stats.pm25_1week)
    }
    
    private func getAqi(pm25: Double) -> AqiBasic {            // createobject
        let aqi = AqiBasic()
        aqi.aqiD = aqiFromPM(pm: pm25)
        aqi.aqi = String(format: "%.1f µg/㎥", aqi.aqiD)
        if aqi.aqiD >= 301 {
            aqi.concern = "Hazardous";
            aqi.desc = "301 >: Health warning of emergency conditions: everyone is more likely to be affected."
            aqi.backgroundColor = UIColor(red:128/255, green:0/255, blue:64/255, alpha:1.0) // Maroon
            aqi.textColor = UIColor.white
        } else if aqi.aqiD >= 201 {
            aqi.concern = "Very Unhealthy";
            aqi.desc = "201-300: Health warnings of emergency conditions. The entire population is more likely to be affected. "
            aqi.backgroundColor = UIColor.purple
            aqi.textColor = UIColor.white
        } else if aqi.aqiD >= 151 {
            aqi.concern = "Unhealthy";
            aqi.desc = "151-200: Everyone may begin to experience health effects; members of sensitive groups may experience more serious health effects."
            aqi.backgroundColor = UIColor.red
            aqi.textColor = UIColor.white
        } else if aqi.aqiD >= 101 {
            aqi.concern = "Unhealthy for Sensitive Groups";
            aqi.desc = "101-150: Members of sensitive groups may experience health effects. The general public is not likely to be affected."
            aqi.backgroundColor = UIColor.orange
            aqi.textColor = UIColor.white
        } else if aqi.aqiD >= 51 {
            aqi.concern = "Moderate";
            aqi.desc = "51-100: Air quality is acceptable; however, for some pollutants there may be a moderate health concern for a very small number of people who are unusually sensitive to air pollution."
            aqi.backgroundColor = UIColor.yellow
            aqi.textColor = UIColor.black
        } else if aqi.aqiD >= 0 {
            aqi.concern = "Good";
            aqi.desc = "0-50: Air quality is considered satisfactory, and air pollution poses little or no risk"
            aqi.backgroundColor = UIColor.green
            aqi.textColor = UIColor.black
        } else {
            aqi.concern = "Error";
            aqi.desc = "There was an error"
            aqi.backgroundColor = UIColor.red
            aqi.textColor = UIColor.white
        }
        return aqi
    }

    // this calculates the air quality index from particle measurement
    private func aqiFromPM(pm: Double) -> Double {
        if pm > 350.5 {
            return calcAQI(Cp: pm, lh: 500, ll: 401, BPh: 500, BPI: 350.5);
        } else if pm > 250.5 {
            return calcAQI(Cp: pm, lh: 400, ll: 301, BPh: 350.4, BPI: 250.5);
        } else if pm > 150.5 {
            return calcAQI(Cp: pm, lh: 300, ll: 201, BPh: 250.4, BPI: 150.5);
        } else if pm > 55.5 {
            return calcAQI(Cp: pm, lh: 200, ll: 151, BPh: 150.4, BPI: 55.5);
        } else if pm > 35.5 {
            return calcAQI(Cp: pm, lh: 150, ll: 101, BPh: 55.4, BPI: 35.5);
        } else if pm > 12.1 {
            return calcAQI(Cp: pm, lh: 100, ll: 51, BPh: 35.4, BPI: 12.1);
        } else if pm >= 0 {
            return calcAQI(Cp: pm, lh: 50, ll: 0, BPh: 12, BPI: 0);
        } else {return 0.0}
    }
    
    private func calcAQI(Cp: Double, lh: Double, ll: Double, BPh: Double, BPI: Double) -> Double {
        let a = lh - ll
        let b = BPh - BPI
        let c = Cp - BPI
        return round((a/b)*c + ll)
    }
    
    private func bplFromPM(pm: Double) -> Int {
        if pm > 350.5 {
            return 401
        } else if pm > 250.5 {
            return 301;
        } else if pm > 150.5 {
            return 201;
        } else if pm > 55.5 {
            return 151;
        } else if pm > 35.5 {
            return 101;
        } else if pm > 12.1 {
            return 51;
        } else if pm >= 0 {
            return 0;
        } else {
            return 0;
        }
    }
    
    private func bphFromPM(pm: Double) -> Int {
        if pm > 350.5 {
            return 500;
        } else if pm > 250.5 {
            return 500;
        } else if pm > 150.5 {
            return 300;
        } else if pm > 55.5 {
            return 200;
        } else if pm > 35.5 {
            return 150;
        } else if pm > 12.1 {
            return 100;
        } else if pm >= 0 {
            return 50;
        } else {
            return 0;
        }
    }
    
}
