//
//  PurpleBridge.swift
//  SwiftExample
//
//  Created by jim kardach on 6/7/22.
/*
 This performs a bridge between swift and objective-c by creating a simple object
 can be passed back to
 */

import Foundation
import UIKit

@objc public class PurpleBridge: NSObject, UpdatePurpleDelegate {
    private var purpleManager = PurpleManager()
    
    // values to pass back
    @objc public var name = ""
    @objc public var humidity = ""
    @objc public var temp = ""
    @objc public var pressure = ""
    
    @objc public var backgroundColor: UIColor = UIColor.white
    @objc public var textColor: UIColor = UIColor.blue
    
    @objc public var aqi = ""
    @objc public var concern = ""
    @objc public var desc = ""
    
    @objc public var aqi10min = ""
    @objc public var concern10min = ""
    @objc public var desc10min = ""
    
    @objc public var aqi30min = ""
    @objc public var concern30min = ""
    @objc public var desc30min = ""
    
    @objc public var aqi60min = ""
    @objc public var concern60min = ""
    @objc public var desc60min = ""
    
    @objc public var aqi6hr = ""
    @objc public var concern6hr = ""
    @objc public var desc6hr = ""
    
    @objc public var aqi24hr = ""
    @objc public var concern24hr = ""
    @objc public var desc24hr = ""
    
    @objc public var aqi1wk = ""
    @objc public var concern1wk = ""
    @objc public var desc1wk = ""
    
    public func performRequest(_ sensorID: String = "79963") {
        purpleManager.delegate = self
        purpleManager.performRequest(sensorID)
    }
    
    public func didUpdatePurple(_ purple: PurpleModel) {
        
        // simple return structure for objective-c
        name = purple.name
        humidity = purple.humidity
        temp = purple.temp
        pressure = purple.pressure
        textColor = purple.pm25.textColor
        backgroundColor = purple.pm25.backgroundColor
        
        aqi = purple.pm25.aqi
        concern = purple.pm25.concern
        desc = purple.pm25.desc
        
        aqi10min = purple.pm25_10minute.aqi
        concern10min = purple.pm25_10minute.concern
        desc10min = purple.pm25_10minute.desc
        
        aqi30min = purple.pm25_30minute.aqi
        concern30min = purple.pm25_30minute.concern
        desc30min = purple.pm25_30minute.desc
        
        aqi60min = purple.pm25_60minute.aqi
        concern60min = purple.pm25_60minute.concern
        desc60min = purple.pm25_60minute.desc
        
        aqi6hr = purple.pm25_6hour.aqi
        concern6hr = purple.pm25_6hour.concern
        desc6hr = purple.pm25_6hour.desc
        
        aqi24hr = purple.pm25_24hour.aqi
        concern24hr = purple.pm25_24hour.concern
        desc24hr = purple.pm25_24hour.desc
        
        aqi1wk = purple.pm25_1week.aqi
        concern1wk = purple.pm25_1week.concern
        desc1wk = purple.pm25_1week.desc

    }
    
    public func didFailWithError(_ error: Error) {
        print("Purple Manager Failed")
    }
    
    
}

