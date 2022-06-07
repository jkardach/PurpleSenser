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
//import PurpleSenser
import UIKit

@objc public protocol UpdatePurpleBridgeDelegate {
    func didUpdatePurpleBridge(_ purple: PurpleBridge)
    func didFailWithError(_ error: Error)
}

@objc public class PurpleBridge: NSObject, UpdatePurpleDelegate {
    public var delegate: UpdatePurpleBridgeDelegate?
    private var purpleManager = PurpleManager()
    
    // values to pass back
    @objc public var name = ""
    @objc public var humidity = ""
    @objc public var temp = ""
    @objc public var pressure = ""
    @objc public var aqi = ""
    @objc public var concern = ""
    @objc public var desc = ""
    @objc public var backgroundColor: UIColor = UIColor.white
    @objc public var textColor: UIColor = UIColor.blue
    
    
    public func performRequest() {
        purpleManager.delegate = self
        purpleManager.performRequest()
    }
    
    public func didUpdatePurple(_ purple: PurpleModel) {
//        print("purple location: \(purple.name)")
//        print("humidity: \(purple.humidity)")
//        print("temperature: \(purple.temp)")
//        print("pressure: \(purple.pressure)")
//        print("air quality: \(purple.pm25.aqi) ")
//        
//        print("AQ: \(purple.pm25.aqi)")
//        print("AQ Concern: \(purple.pm25.concern)")
//        print("AQ Description: \(purple.pm25.desc)")
//        
//        print("AQ10min: \(purple.pm25_10minute.aqi)")
//        print("AQ10min Concern: \(purple.pm25_10minute.concern)")
//        print("AQ10min Description: \(purple.pm25_10minute.desc)")
//        
//        print("AQ30min: \(purple.pm25_30minute.aqi)")
//        print("AQ30min Concern: \(purple.pm25_30minute.concern)")
//        print("AQ30min Description: \(purple.pm25_30minute.desc)")
//        
//        print("AQ1hr: \(purple.pm25_60minute.aqi)")
//        print("AQ1hr Concern: \(purple.pm25_60minute.concern)")
//        print("AQ1hr Description: \(purple.pm25_60minute.desc)")
//        
//        print("AQ6hr: \(purple.pm25_6hour.aqi)")
//        print("AQ6hr Concern: \(purple.pm25_6hour.concern)")
//        print("AQ6hr Description: \(purple.pm25_6hour.desc)")
//        
//        print("AQ24hr: \(purple.pm25_24hour.aqi)")
//        print("AQ24hr Concern: \(purple.pm25_24hour.concern)")
//        print("AQ24hr Description: \(purple.pm25_24hour.desc)")
//        
//        print("AQ1week: \(purple.pm25_24hour.aqi)")
//        print("AQ1week Concern: \(purple.pm25_24hour.concern)")
//        print("AQ1week Description: \(purple.pm25_24hour.desc)")
        
        // simple return structure for objective-c
        name = purple.name
        humidity = purple.humidity
        temp = purple.temp
        pressure = purple.pressure
        aqi = purple.pm25.aqi
        concern = purple.pm25.concern
        desc = purple.pm25.desc
        textColor = purple.pm25.textColor
        backgroundColor = purple.pm25.backgroundColor
        
        self.delegate?.didUpdatePurpleBridge(self)
    }
    
    public func didFailWithError(_ error: Error) {
        print("Purple Manager Failed")
    }
    
    
}
