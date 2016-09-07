//
//  constants.swift
//  SunnyOrNot?
//
//  Created by AW on 02/09/2016.
//  Copyright © 2016 goneToPlaid. All rights reserved.
//

import Foundation

let base_URL = "http://api.openweathermap.org/data/2.5/"
let type1 = "weather?"
let type2 = "forecast/daily?"
let latitude = "lat="
let longtitude = "&lon="
let extraForecast = "&cnt=7&mode=json"
let appId = "&appid=ec602e8fb9703dfa14c3222c031c330f"


let CURRENT_WEATHER_URL = "\(base_URL)\(type1)\(latitude)\(Location.sharedInstance.latitude!)\(longtitude)\(Location.sharedInstance.longitude!)\(appId)"

let FORECAST_WEATHER_URL = "\(base_URL)\(type2)\(latitude)\(Location.sharedInstance.latitude!)\(longtitude)\(Location.sharedInstance.longitude!)\(extraForecast)\(appId)"

typealias DownloadComplete = () -> ()


     
