//
//  TodayWeatherTableViewCell.swift
//  Weather
//
//  Created by Narine Balasanyan on 10/6/17.
//  Copyright © 2017 Nar9. All rights reserved.
//

import UIKit

class TodayWeatherTableViewCell: UITableViewCell
{
    
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var weatherLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    var weather: WeatherManager? {
        didSet {
            updateUI()
        }
    }
    
    func updateUI() {
        weather?.downloadWeatherDetails { () -> () in
//            self.iconImageView.image = UIImage(named: (self.weather?.weather?.icon)!)
            self.weatherLabel.text = self.weather?.weather?.weather
            let maxTemp = self.weather?.weather?.maxTemp ?? ""
            let minTemp = self.weather?.weather?.minTemp ?? ""
            self.temperatureLabel.text = "Max \(maxTemp)) °C, Min \(minTemp) °C"
            let city = self.weather?.weather?.cityName ?? ""
            let country = self.weather?.weather?.country ?? ""
            self.locationLabel.text = "\(city), " + "\(country)"
            self.dateLabel.text = self.weather?.weather?.date
        }
    }
}
