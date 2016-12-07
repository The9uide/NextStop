//
//  TravelingViewController.swift
//  NextStop
//
//  Created by Trithep Ratanapipop on 12/8/2559 BE.
//  Copyright © 2559 it56070048.it.kmitl.ac.th. All rights reserved.
//

import UIKit
import CoreLocation
import UserNotifications


class TravelingViewController: UIViewController, CLLocationManagerDelegate {

    var locationManager:CLLocationManager!
    var stations = StationManager.sharedStationManager
    var isGrantedNotificationAccess:Bool = false
    
    @IBOutlet weak var NextStationLabel: UILabel!
    @IBOutlet weak var DestinationStationLabel: UILabel!
    @IBOutlet weak var TimeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        // Do any additional setup after loading the view.
        determineMyCurrentLocation()
        setupUI()
        setupNotification()
    }

    func setupNotification(){
        UNUserNotificationCenter.current().requestAuthorization( options: [.alert,.sound,.badge], completionHandler: { (granted,error) in self.isGrantedNotificationAccess = granted})
    }
    
    func notiForNextStation(){
        let alert = UIAlertController(title: "เตรียมตัวให้พร้อม", message: "สถานีต่อไปคือสถานีปลายทางของคุณ", preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "ตกลง", style: .default, handler: { (action) in
            //execute some code when this option is selected
//            manager.stopUpdatingLocation()
        }))
        
        self.present(alert, animated: true, completion: nil)
        
        if isGrantedNotificationAccess{
            let content = UNMutableNotificationContent()
            content.title = "เตรียมตัวให้พร้อม"
            content.subtitle = "สถานีต่อไปคือสถานีปลายทางของคุณ"
            content.body = "โปรดเตรีตมตัวลงจากขบวนรถ"
            
            //Set the trigger of the notification -- here a timer.
            let trigger = UNTimeIntervalNotificationTrigger(
                timeInterval: 10.0,
                repeats: false)
            
            //Set the request for the notification from the above
            let request = UNNotificationRequest(
                identifier: "nextStation",
                content: content,
                trigger: trigger
            )
            
            //Add the notification to the currnet notification center
            UNUserNotificationCenter.current().add(
                request, withCompletionHandler: nil)
            print("noti done")
        }
        print("noti====")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
        print("Current location = \(userLocation.coordinate.latitude) ,\(userLocation.coordinate.longitude) ")
        setupUI()
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error)
    {
        print("Error Location >>\(error)")
    }

    func setupUI(){
        let nextStation = stations.getStationFromIndex(stations.getNextStationIndex())
        NextStationLabel.text = nextStation.name
        DestinationStationLabel.text = stations.destinationStation()!.name
    }
    
    @IBAction func cancel(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }

    @IBOutlet weak var notii: UIButton!
    @IBAction func no(_ sender: Any) {
        notiForNextStation()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
