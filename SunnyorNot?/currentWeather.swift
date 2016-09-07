//
//  currentWeather.swift
//  SunnyOrNot?
//
//  Created by AW on 02/09/2016.
//  Copyright © 2016 goneToPlaid. All rights reserved.
//

import UIKit
import Alamofire

class CurrentWeather {
    var _cityName: String!
    var _date: String!
    var _weatherType: String!
    var _currentTemp: Double!
    
    var cityName: String {
        if _cityName == nil {
            _cityName = ""
        }
        return _cityName
    }
    
    var date: String {
        if _date == nil {
            _date = ""
            
        }
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .none
        let currentDate = dateFormatter.string(from: Date())
        self._date = "Today \(currentDate)"
        return _date
    }
    var currentTemp: Double {
        if _currentTemp == nil {
            _currentTemp = 0.0
        }
        return _currentTemp
    }
    var weatherType: String {
        if _weatherType == nil {
            _weatherType = ""
        }
            return _weatherType
    }
    
    
    func downloadWeatherDetails(completed: DownloadComplete) {
        
        Alamofire.request(CURRENT_WEATHER_URL, withMethod: .get).responseJSON { response in
            let result = response.result
            
            if let dict = result.value as? Dictionary<String, AnyObject> {
                if let name = dict["name"] as? String {
                    self._cityName = name.capitalized
                    print(self._cityName)
                    
                }
                
                if let weather = dict["weather"] as? [Dictionary<String, AnyObject>] {
                    if let main = weather[0]["main"] as? String {
                        self._weatherType = main.capitalized
                        print(self._weatherType)
                        
                    }
                    
                }
                
                if let main = dict["main"] as? Dictionary<String, AnyObject> {
            
                    if let currentTemperature = main["temp"] as? Double {
                        let celcius: Double!
                        celcius = currentTemperature  - 273.16
                        let celciusFinal = Double(round(10 * celcius/10))
                    self._currentTemp = celciusFinal
                        print(self._currentTemp)
                }
                
            
            
        }
            }
        
        completed()
        
        
        
        
        
    }
    
}


}







