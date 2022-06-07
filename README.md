# PurpleSenser

This package provides the interface to a purple air sensors (the new one as of 2022) from Swift and ObjC returning the name of the sensor, humidity, temperature, pressure, and the air quality index ( current value and several types of running averages).

The request is made via the method "performRequest" passing it the deviceID of the sensor.

The deviceID can be obtained from purple air map, where you context click on the sensor, scroll to the button of the pop-up where it says "Get This Widget". Clicking on this gives another pop-up menu where you can click JSON which shows the fields.

For example "79963" is the device ID of the saratoga swim club's sensor.

The interface is slightly different for the objective-C and Swift.  the objective-C has an additional brige class, to package all of the values nicely as part of the overall purpleBridge object.  

The swift is a bit more difficult to use in that you need to conform to the PurpleManager protocol "UpdatePurpleDelegate", and the values are passed to your calling program via the delegate function 
        func didUpdatePurple(_ purple: PurpleModel). 
    
    If there was an error, the 
        func didFailWithError(_ error: Error) 
is called. The data is returned in an object of type PurpleModel which has properties for each of the sensor values.

The library can be used by swift programs or objective-c programs.

///////////////////////////////////////////////

Example Swift:
//  ViewController.swift
//  Swift Example
//
//  Created by jim kardach on 6/1/22.
//

import UIKit
import PurpleSenser

class ViewController: UIViewController, UpdatePurpleDelegate {  // conform to protocol
    
    var purpleManager = PurpleManager() // create PurpleManager object
    
    override func viewDidLoad() {
        super.viewDidLoad()

        purpleManager.delegate = self   // set delegate
        purpleManager.performRequest(@"79963")  // perform request
    
    }
    
    // delegate methods for UpdatePurpleDelegate
    func didUpdatePurple(_ purple: PurpleModel) {
    
        print("purple location: \(purple.name)")
        print("humidity: \(purple.humidity)")
        print("temperature: \(purple.temp)")
        print("pressure: \(purple.pressure)")
        
        print("AQ: \(purple.pm25.aqi)")
        print("AQ Concern: \(purple.pm25.concern)")
        print("AQ Description: \(purple.pm25.desc)")
        
        print("AQ10min: \(purple.pm25_10minute.aqi)")
        print("AQ10min Concern: \(purple.pm25_10minute.concern)")
        print("AQ10min Description: \(purple.pm25_10minute.desc)")
        
        print("AQ30min: \(purple.pm25_30minute.aqi)")
        print("AQ30min Concern: \(purple.pm25_30minute.concern)")
        print("AQ30min Description: \(purple.pm25_30minute.desc)")
        
        print("AQ1hr: \(purple.pm25_60minute.aqi)")
        print("AQ1hr Concern: \(purple.pm25_60minute.concern)")
        print("AQ1hr Description: \(purple.pm25_60minute.desc)")
        
        print("AQ6hr: \(purple.pm25_6hour.aqi)")
        print("AQ6hr Concern: \(purple.pm25_6hour.concern)")
        print("AQ6hr Description: \(purple.pm25_6hour.desc)")
        
        print("AQ24hr: \(purple.pm25_24hour.aqi)")
        print("AQ24hr Concern: \(purple.pm25_24hour.concern)")
        print("AQ24hr Description: \(purple.pm25_24hour.desc)")
        
        print("AQ1week: \(purple.pm25_24hour.aqi)")
        print("AQ1week Concern: \(purple.pm25_24hour.concern)")
        print("AQ1week Description: \(purple.pm25_24hour.desc)")
    }
    
    func didFailWithError(_ error: Error) {
        print("Error \(error.localizedDescription)")
    }
}

///////////////////////////////////////////////

//  ViewController.m
//  Objc Example
//
//  Created by jim kardach on 6/1/22.
//
@interface ViewController ()
@property (nonatomic, strong) PurpleBridge *purple;

@end

@implementation ViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.purple = [[PurpleBridge alloc] init];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:YES];
    
    [self refreshPurple];
}

-(void)refreshPurple {
    [self.purple performRequestWithSensorID:@"79963"];   // refresh
}
