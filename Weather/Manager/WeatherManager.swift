//
//  WeatherManager.swift
//  Weather
//
//  Created by Narine Balasanyan on 10/6/17.
//  Copyright © 2017 Nar9. All rights reserved.
//

import UIKit
import Alamofire

class WeatherManager: NSObject {
    
    let weatherUrl: String?
    var index: Int?
    var weather: Weather?
    
    init(lat: Double, lon: Double, index: Int) {
        self.weatherUrl = "\(baseUrl)lat=\(lat)&lon=\(lon)\(unitsUrl)\(apiKey)"
        self.index = index
    }
    
    func downloadWeatherDetails(completed: @escaping () -> ()) {
        let url = URL(string: weatherUrl!)!
        Alamofire.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil).responseJSON { response in
            
            if let dict = response.result.value as? [String:Any] {
                self.weather = Weather(dictionary: dict, dateIndex: self.index!)
            }
        }
        completed()
    }
}


