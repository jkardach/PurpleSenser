//
//  PurpleBridge.swift
//  SwiftExample
//
//  Created by jim kardach on 6/7/22.
/*
 This performs a bridge between swift and objective-c by creating a simple object
 can be passed back to
 
 need to add a protocol so I know when it is done updating
 
 */

import Foundation
import UIKit

//public class Purple: NSObject {
//    @objc public var name = ""
//    @objc public var humidity = ""
//    @objc public var temp = ""
//    @objc public var pressure = ""
//    
//    @objc public var backgroundColor: UIColor = UIColor.white
//    @objc public var textColor: UIColor = UIColor.blue
//    
//    @objc public var aqi = ""
//    @objc public var concern = ""
//    @objc public var desc = ""
//    
//    @objc public var aqi10min = ""
//    @objc public var concern10min = ""
//    @objc public var desc10min = ""
//    
//    @objc public var aqi30min = ""
//    @objc public var concern30min = ""
//    @objc public var desc30min = ""
//    
//    @objc public var aqi60min = ""
//    @objc public var concern60min = ""
//    @objc public var desc60min = ""
//    
//    @objc public var aqi6hr = ""
//    @objc public var concern6hr = ""
//    @objc public var desc6hr = ""
//    
//    @objc public var aqi24hr = ""
//    @objc public var concern24hr = ""
//    @objc public var desc24hr = ""
//    
//    @objc public var aqi1wk = ""
//    @objc public var concern1wk = ""
//    @objc public var desc1wk = ""
//}

//
//@objc public protocol UpdatePurpleBridgeDelegate {
//    func didUpdatePurpleBridge(purple: Purple)
//    func didFailWithError(_ error: Error)
//}
//
//@objc public class PurpleBridge: NSObject, UpdatePurpleDelegate {
//    private var purpleManager = PurpleManager()
//    
//    // values to pass back
//    
//    @objc public func performRequest(sensorID: String) {
//        purpleManager.delegate = self
//        purpleManager.performRequest(sensorID)
//    }
//    
//    public func didUpdatePurple(_ purpleM: PurpleModel) {
//        var purple = Purple()
//        // simple return structure for objective-c
//        purple.name = purpleM.name
//        purple.humidity = purpleM.humidity
//        purple.temp = purpleM.temp
//        purple.pressure = purpleM.pressure
//        purple.textColor = purpleM.pm25.textColor
//        purple.backgroundColor = purpleM.pm25.backgroundColor
//        
//        purple.aqi = purpleM.pm25.aqi
//        purple.concern = purpleM.pm25.concern
//        purple.desc = purpleM.pm25.desc
//        
//        purple.aqi10min = purpleM.pm25_10minute.aqi
//        purple.concern10min = purpleM.pm25_10minute.concern
//        purple.desc10min = purpleM.pm25_10minute.desc
//        
//        purple.aqi30min = purpleM.pm25_30minute.aqi
//        purple.concern30min = purpleM.pm25_30minute.concern
//        purple.desc30min = purpleM.pm25_30minute.desc
//        
//        purple.aqi60min = purpleM.pm25_60minute.aqi
//        purple.concern60min = purpleM.pm25_60minute.concern
//        purple.desc60min = purpleM.pm25_60minute.desc
//        
//        purple.aqi6hr = purpleM.pm25_6hour.aqi
//        purple.concern6hr = purpleM.pm25_6hour.concern
//        purple.desc6hr = purpleM.pm25_6hour.desc
//        
//        purple.aqi24hr = purpleM.pm25_24hour.aqi
//        purple.concern24hr = purpleM.pm25_24hour.concern
//        purple.desc24hr = purpleM.pm25_24hour.desc
//        
//        purple.aqi1wk = purpleM.pm25_1week.aqi
//        purple.concern1wk = purpleM.pm25_1week.concern
//        purple.desc1wk = purpleM.pm25_1week.desc
//        
//        
//        self.delegate?.didUpdatePurple(purple)
//    }
//    
//    public func didFailWithError(_ error: Error) {
//        print("Purple Manager Failed")
//    }
//    
//    
//}

