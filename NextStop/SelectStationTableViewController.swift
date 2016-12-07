//
//  SelectStationTableViewController.swift
//  NextStop
//
//  Created by Mayuree on 12/4/16.
//  Copyright © 2016 it56070048.it.kmitl.ac.th. All rights reserved.
//

import UIKit

class SelectStationTableViewController: UITableViewController{

//    var stations = ["สุวรรณภูมิ","ลาดกระบัง","บ้านทับช้าง","หัวหมาก","รามคำแหง","มักกะสัน","ราชปรารภ","พญาไท"]
    var stations = StationManager.sharedStationManager
    var selectStation: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        //stations.getNearestStaion(latitude: 13.698090, longitude: 100.752265)
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {

        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return stations.stationCount()
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let stationCell = stations.getStationFromIndex(index: indexPath.row)
        
        var selected = false
        if stations.stationCurrentIndex == indexPath.row {
            selected = true
        }
        
//        print(stations.getDistance(station: stationCell, latitude: 13.698090, longitude: 100.752265))
        
        if stationCell.connectStation != nil {
            let cell = tableView.dequeueReusableCell(withIdentifier: "StationDetailTableViewCell", for: indexPath) as! StationDetailTableViewCell
            cell.StationNameLabel.text = stationCell.name
            cell.StationDetailLabel.text  = "รถไฟฟ้า \(stationCell.connectStation!)"
            cell.StationIdLabel.text = "(\(stationCell.id))"
            
            if selected {
                cell.StationNameLabel.isEnabled = false
                cell.selectionStyle = UITableViewCellSelectionStyle.none
                cell.isUserInteractionEnabled = false
                cell.icon.isHidden = false
                cell.iconLabel.isHidden = false
            }
            return cell
        }
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "StationTableViewCell", for: indexPath) as! StationTableViewCell
            cell.StationName.text = stationCell.name
            cell.StationId.text = "(\(stationCell.id))"
            
            if selected {
                cell.StationName.isEnabled = false
                cell.selectionStyle = UITableViewCellSelectionStyle.none
                cell.isUserInteractionEnabled = false
                cell.icon.isHidden = false
                cell.iconLabel.isHidden = false
            }
            return cell
        }
    }
    
    @IBAction func cancel(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        selectStation = stations.getStationFromIndex(index: (tableView.indexPathForSelectedRow?.row)!).name
        if stations.isDepartured{
            stations.stationCurrentIndex = (tableView.indexPathForSelectedRow?.row)!
            print("departure")
        }else {
            stations.stationDestinationIndex = (tableView.indexPathForSelectedRow?.row)!
            print(stations.stationDestinationIndex!)
        }
    }
    
    

}
