//
//  StartNavigationViewController.swift
//  NextStop
//
//  Created by Mayuree on 12/7/16.
//  Copyright © 2016 it56070048.it.kmitl.ac.th. All rights reserved.
//

import UIKit

class StartNavigationViewController: UIViewController {

    @IBOutlet weak var DeparturedStationLabel: UILabel!
    @IBOutlet weak var StationNameLabel: UILabel!
    @IBOutlet weak var SideOfPlatformLabel: UILabel!
    @IBOutlet weak var TimeToArrivedLabel: UILabel!
    @IBOutlet weak var ConnectStationLabel: UILabel!
    
    var stations = StationManager.sharedStationManager
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func setupUI(){
        let destination = stations.destinationStation()!
        DeparturedStationLabel.text = "จาก \"\(stations.currentStation()!.name)\" ไป"
        StationNameLabel.text = destination.name
        SideOfPlatformLabel.text = sideOfPlatform()
        ConnectStationLabel.text = destination.connectStation != nil ? "จุดเชื่อมต่อ \(destination.connectStation)" : "ไม่มีจุดเชื่อมต่อ"
    }
    
    func sideOfPlatform() -> String{
        let tmp = stations.stationCurrentIndex! - stations.stationDestinationIndex!
        if tmp<0{
            return "ขึ้นฝั่ง พญาไท"
        }else{
            return "ขึ้นฝั่ง สุวรรณภูมิ"
        }
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
