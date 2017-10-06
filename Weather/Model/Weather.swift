//
//  Weather.swift
//  Weather
//
//  Created by Narine Balasanyan on 10/6/17.
//  Copyright © 2017 Nar9. All rights reserved.
//

import Foundation

class Weather
{
    var cityName: String?
    var country: String?
    var date: String?
    var weather: String?
    var icon: String?
    var minTemp: String?
    var maxTemp: String?
    
    init(dictionary: [String:Any], dateIndex: Int) {
        
        if let city = dictionary["city"] as? [String:Any] {
            if let name = city["name"] as? String {
                self.cityName = name
            }
            if let country = city["country"] as? String {
                self.country = country
            }
        }
        
        if let list = dictionary["list"] as? [[String:Any]] {
            if let dt = list[dateIndex]["dt"] as? Int {
                let date = NSDate(timeIntervalSince1970: TimeInterval(dt))
                let dateFormatter = DateFormatter()
                dateFormatter.dateStyle = .medium
                dateFormatter.timeZone = TimeZone(abbreviation: "PDT")
                self.date = dateFormatter.string(from: date as Date)
            }
            if let temperature = list[dateIndex]["temp"] as? [String:Any] {
                if let minTemp = temperature["min"] as? Double {
                    self.minTemp = String(minTemp)
                }
                if let maxTemp = temperature["max"] as? Double {
                    self.maxTemp = String(maxTemp)
                }
            }
            if let weather = list[dateIndex]["weather"] as? [String:Any] {
                if let weatherDesc = weather["main"] as? String {
                    self.weather = weatherDesc
                }
                if let icon = weather["icon"] as? String {
                    self.icon = icon
                }
            }
        }
    }
}

