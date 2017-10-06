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
    
    // Properties
    let locationManager = CLLocationManager()
    var latitude: Double?
    var longitude: Double?
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
        let locValue = manager.location!.coordinate
        latitude = locValue.latitude
        longitude = locValue.longitude
        tableView.reloadData()
        locationManager.stopUpdatingLocation()
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
            if let lat = latitude, let lon = longitude {
                cell?.weather = WeatherManager(lat: lat, lon: lon, index: indexPath.row)
            }
            return cell!
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "otherDaysWeatherCell") as? OtherDaysWeatherTableViewCell
            if let lat = latitude, let lon = longitude {
                cell?.weather = WeatherManager(lat: lat, lon: lon, index: indexPath.row)
            }
            return cell!
        }
    }
}

