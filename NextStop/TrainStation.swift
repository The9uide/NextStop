//
//  TrainStation.swift
//  NextStop
//
//  Created by Mayuree on 12/5/16.
//  Copyright © 2016 it56070048.it.kmitl.ac.th. All rights reserved.
//

import Foundation

class TrainStation {
    var name: String
    var id: String
    var connectStation: String?
    var latitude: Double = 0
    var longitude: Double = 0
    
    init(name: String, id:String, connectStation:String?,latitude: Double, longitude:Double) {
        self.name = name
        self.id = id
        self.connectStation = connectStation
        self.latitude = latitude
        self.longitude = longitude
    }
}
