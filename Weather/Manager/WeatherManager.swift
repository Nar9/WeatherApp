//
//  WeatherManager.swift
//  Weather
//
//  Created by Narine Balasanyan on 10/6/17.
//  Copyright © 2017 Nar9. All rights reserved.
//

import UIKit
import Alamofire
import RealmSwift

class WeatherManager {
    
    let weatherUrl: String?
    var index: Int?
    var weather: Weather?
    
    init(lat: Float, lon: Float, index: Int) {
        self.weatherUrl = "\(baseUrl)lat=\(lat)&lon=\(lon)\(unitsUrl)\(apiKey)"
        self.index = index
    }
    
    func saveWeatherDetails() {
        let object = WeatherRealm()
        object.cityName = "Yerevan"
        object.country = "Armenia"
        object.date = "6 October"
        object.weather = "Sunny"
        object.icon = "sunny"
        object.maxTemp = "15"
        object.minTemp = "9"
        let realm = try! Realm()
        
        // Add an object
        try! realm.write {
            realm.add(object)
        }
    }
    
//    func downloadWeatherDetails(completed: @escaping () -> ()) {
//
//        let url = URL(string: weatherUrl!)!
//        Alamofire.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil).responseJSON { response in
//            print(response)
//            if let dict = response.result.value as? [String:Any] {
//                self.weather = Weather(dictionary: dict, dateIndex: self.index!)
//            }
//        }
//        completed()
//    }
}


