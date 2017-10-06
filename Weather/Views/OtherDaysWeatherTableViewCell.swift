//
//  OtherDaysWeatherTableViewCell.swift
//  Weather
//
//  Created by Narine Balasanyan on 10/6/17.
//  Copyright © 2017 Nar9. All rights reserved.
//

import UIKit
import RealmSwift

class OtherDaysWeatherTableViewCell: UITableViewCell {
    
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var weatherLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    
    var weather: WeatherManager? {
        didSet {
            updateUI()
        }
    }
    
    func updateUI() {
        self.weather?.saveWeatherDetails()
        let realm = try! Realm()
        let savedWeather = realm.objects(WeatherRealm.self).first
        
        self.iconImageView.image = UIImage(named: (savedWeather?.icon)!)
        self.weatherLabel.text = savedWeather?.weather
        let maxTemp = savedWeather?.maxTemp ?? ""
        let minTemp = savedWeather?.minTemp ?? ""
        self.temperatureLabel.text = "Max \(maxTemp) °C, Min \(minTemp) °C"
//        weather?.downloadWeatherDetails { () -> () in
//            //            self.iconImageView.image = UIImage(named: (self.weather?.weather?.icon)!)
//            self.weatherLabel.text = self.weather?.weather?.weather
//            let maxTemp = self.weather?.weather?.maxTemp ?? ""
//            let minTemp = self.weather?.weather?.minTemp ?? ""
//            self.temperatureLabel.text = "Max \(maxTemp)) °C, Min \(minTemp) °C"
//        }
    }
  
}
