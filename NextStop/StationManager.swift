//
//  StationManager.swift
//  NextStop
//
//  Created by Mayuree on 12/5/16.
//  Copyright © 2016 it56070048.it.kmitl.ac.th. All rights reserved.
//

import Foundation

class StationManager {
    static let sharedStationManager = StationManager()
    
    var Stations: [TrainStation] = []
    var stationCurrentIndex: Int?
    var stationDestinationIndex: Int?
    var isDepartured = true
    var userLocation: [Double]?
    private init() {
        Stations.append(TrainStation(name: "สุวรรณภูมิ", id: "A1",connectStation: nil, latitude: 13.698090, longitude: 100.752265))
        Stations.append(TrainStation(name: "ลาดกระบัง", id: "A2",connectStation: nil, latitude: 13.727669, longitude: 100.748717))
        Stations.append(TrainStation(name: "บ้านทับช้าง", id: "A3",connectStation: nil, latitude: 13.732827, longitude: 100.691467))
        Stations.append(TrainStation(name: "หัวหมาก", id: "A4",connectStation: nil, latitude: 13.737958, longitude: 100.645347))
        Stations.append(TrainStation(name: "รามคำแหง", id: "A5",connectStation: nil, latitude: 13.742963, longitude: 100.600253))
        Stations.append(TrainStation(name: "มักกะสัน", id: "A6",connectStation: "MRT เพชรบุรี", latitude: 13.742963, longitude:100.600253))
        Stations.append(TrainStation(name: "ราชปรารภ", id: "A7",connectStation: nil, latitude: 13.755133, longitude: 100.541826))
        Stations.append(TrainStation(name: "พญาไท", id: "A8",connectStation: "BTS พญาไท", latitude: 13.756711, longitude:100.534972))
    }
    
    func stationCount() -> Int{
        return Stations.count
    }
    
    func currentStation() -> TrainStation? {
        if stationCurrentIndex != nil{
            return Stations[stationCurrentIndex!]
        }
        return nil
    }
    
    func setUserLocation(la: Double, lo:Double){
        userLocation = [la, lo]
    }
    
    func destinationStation() -> TrainStation? {
        if stationDestinationIndex != nil{
            return Stations[stationDestinationIndex!]
        }
        
        return nil
    }
    func getAllStation() ->[TrainStation] {
        return Stations
    }
    func getStationFromIndex(index: Int) -> TrainStation {
        return Stations[index]
    }
    func getDistance(station: TrainStation, latitude: Double, longitude: Double) -> Double{
        let xPoint = pow(latitude - station.latitude, 2)
        let yPoint = pow(longitude - station.longitude, 2)
        return sqrt(xPoint + yPoint)
    }
    
    func setDepartureStation(){
        if stationCurrentIndex == nil{
            stationCurrentIndex = getNearestStaion(latitude: userLocation![0], longitude: userLocation![1])
        }
    }
    
    func getNearestStaion(latitude: Double, longitude: Double) -> Int {
        var distance: [Double] = []
        for station in Stations{
            distance.append(getDistance(station: station, latitude: latitude, longitude: longitude))
        }
        let minDistance = distance.min()
        if let index = distance.index(of: minDistance!){
             return index
        }
        return -1
    }
    
}