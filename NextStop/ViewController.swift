//
//  ViewController.swift
//  NextStop
//
//  Created by Mayuree on 12/4/16.
//  Copyright © 2016 it56070048.it.kmitl.ac.th. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet weak var StationNameLabel: UILabel!
    @IBOutlet weak var StationDestinationLabel: UILabel!
    
    var locationManager:CLLocationManager!
    var stations = StationManager.sharedStationManager

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        setupUI()
        determineMyCurrentLocation()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupUI(){
        if stations.destinationStation() != nil{
            StationDestinationLabel.text = stations.destinationStation()?.name
        }else{
            StationDestinationLabel.text = "แตะเพื่อเลือกสถานีปลายทาง"
        }
        if stations.currentStation() != nil{
            StationNameLabel.text = stations.currentStation()?.name
        }else{
            StationNameLabel.text = "แตะเพื่อเลือกสถานีต้นทาง"
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setupUI()
    }
    
    @IBAction func unwindToMealList(_ sender: UIStoryboardSegue) {
        setupUI()
    }
    
    func determineMyCurrentLocation() {
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.startUpdatingLocation()
        }
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let userLocation:CLLocation = locations[0] as CLLocation
        
        // Call stopUpdatingLocation() to stop listening for location updates,
        // other wise this function will be called every time when user location changes.
        
        stations.setUserLocation(la: userLocation.coordinate.latitude, lo: userLocation.coordinate.longitude)
        stations.setDepartureStation()
        setupUI()
        manager.stopUpdatingLocation()
//        print("user latitude = \(userLocation.coordinate.latitude) ,\(userLocation.coordinate.longitude) ")
        
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error)
    {
        print("Error Location >>\(error)")
    }
    
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "departured"{
            stations.isDepartured = true
        } else if segue.identifier == "destination"{
            stations.isDepartured = false
            print("@@@@@@@")
        }
        
    }

}

