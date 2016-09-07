//
//  Location.swift
//  SunnyorNot?
//
//  Created by Allan Wallace on 03/09/2016.
//  Copyright © 2016 Allan Wallace. All rights reserved.
//

import CoreLocation

class Location {
    static var sharedInstance = Location()
    private init(){}
    
    var latitude: Double!
    var longitude: Double!
    
}
