//
//  WeatherViewController.swift
//  Weather
//
//  Created by Narine Balasanyan on 10/6/17.
//  Copyright © 2017 Nar9. All rights reserved.
//

import UIKit
import CoreLocation

class WeatherViewController: UIViewController, CLLocationManagerDelegate
{
    // IBOutlets
    @IBOutlet weak var tableView: UITableView!
    var shouldUpdateLocation = true
    
    // Properties
    let locationManager = CLLocationManager()
    var latitude: Float = 0
    var longitude: Float = 0
    var weather: WeatherManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.estimatedRowHeight = 75
        tableView.rowHeight = UITableViewAutomaticDimension
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    // Finding user location
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if self.shouldUpdateLocation {
            let locValue = manager.location!.coordinate
            latitude = Float(locValue.latitude)
            longitude = Float(locValue.longitude)
            tableView.reloadData()
            self.shouldUpdateLocation = false
            locationManager.stopUpdatingLocation()
        }
    }

}

// MARK: - UITableViewDataSource

extension WeatherViewController: UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "todayWeatherCell") as? TodayWeatherTableViewCell
             cell?.weather = WeatherManager(lat: self.latitude, lon: self.longitude, index: indexPath.row)
            return cell!
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "otherDaysWeatherCell") as? OtherDaysWeatherTableViewCell
            cell?.weather = WeatherManager(lat: self.longitude, lon: self.longitude, index: indexPath.row)

            return cell!
        }
    }
}

