//
//  PurpleManager.swift
//  
//
//  Created by jim kardach on 5/31/22.
//

import Foundation

@objc public protocol UpdatePurpleDelegate {
    func didUpdatePurple(_ purple: Purple)
    func didFailWithError(_ error: Error)
}

// why is this not getting pushed?

public class PurpleManager:NSObject {
    let urlStr1 = "https://api.purpleair.com/v1/sensors/"
    let urlStr2 = "?api_key=715C9E7B-25EA-11EB-910A-42010A800178"
    
    public var delegate: UpdatePurpleDelegate?
    
    
    public func performRequest(_ sensorID: String = "79963") {
        let url = URL(string: urlStr1 + sensorID + urlStr2)
        guard let requestURL = url else { fatalError() }
        request(url: requestURL)    // call request
    }


    func request(url: URL) {
        
        var request = URLRequest(url: url)
        
        // specify HTTP Method to use
        request.httpMethod = "GET"
        
        // send HTTP Request
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            // check if error
            if let error = error {
                print("Error", error.localizedDescription)
                return
            }
            guard let data = data else { return }
            if let purple = self.parseJSON(data: data) {
                let purpleModel = PurpleModel(sensor: purple)
                self.delegate?.didUpdatePurple(purpleModel.convertToPurple())
            }
        }
        
        task.resume()
    }

    func parseJSON(data: Data) -> PurpleSensor? {
        var returnValue: PurpleSensor?
            do {
                returnValue = try JSONDecoder().decode(PurpleSensor.self, from: data)
            } catch {
                print("Error took place\(error.localizedDescription).")
            }
            
            return returnValue
    }
}
