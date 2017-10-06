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

//{"city":{"id":6618983,"name":"Zagreb - Centar","coord":{"lon":15.9775,"lat":45.8131},"country":"HR","population":0},"cod":"200","message":0.0312018,"cnt":7,"list":[{"dt":1507284000,"temp":{"day":12.53,"min":7.75,"max":12.53,"night":7.75,"eve":11.21,"morn":12.53},"pressure":1012.62,"humidity":100,"weather":[{"id":501,"main":"Rain","description":"moderate rain","icon":"10d"}],"speed":2.1,"deg":90,"clouds":92,"rain":11},{"dt":1507370400,"temp":{"day":12.89,"min":4.11,"max":14.56,"night":6.57,"eve":14.55,"morn":4.11},"pressure":1017.73,"humidity":83,"weather":[{"id":800,"main":"Clear","description":"sky is clear","icon":"01d"}],"speed":2.01,"deg":21,"clouds":0},{"dt":1507456800,"temp":{"day":14.17,"min":7.08,"max":18.07,"night":11.85,"eve":17.52,"morn":7.08},"pressure":1012.26,"humidity":78,"weather":[{"id":802,"main":"Clouds","description":"scattered clouds","icon":"03d"}],"speed":1.8,"deg":234,"clouds":32},{"dt":1507543200,"temp":{"day":14.45,"min":8.3,"max":16.36,"night":11.06,"eve":15.91,"morn":8.35},"pressure":1015.86,"humidity":84,"weather":[{"id":500,"main":"Rain","description":"light rain","icon":"10d"}],"speed":1.8,"deg":42,"clouds":20},{"dt":1507629600,"temp":{"day":15.39,"min":2.97,"max":15.39,"night":4.98,"eve":9.09,"morn":2.97},"pressure":1004.35,"humidity":0,"weather":[{"id":800,"main":"Clear","description":"sky is clear","icon":"01d"}],"speed":1.56,"deg":164,"clouds":0},{"dt":1507716000,"temp":{"day":19.2,"min":6.84,"max":19.2,"night":12.92,"eve":15.13,"morn":6.84},"pressure":1001.94,"humidity":0,"weather":[{"id":500,"main":"Rain","description":"light rain","icon":"10d"}],"speed":3.73,"deg":242,"clouds":6},{"dt":1507802400,"temp":{"day":20.06,"min":12.25,"max":20.06,"night":12.25,"eve":16.14,"morn":13.11},"pressure":1000.69,"humidity":0,"weather":[{"id":800,"main":"Clear","description":"sky is clear","icon":"01d"}],"speed":2.43,"deg":238,"clouds":13}]}

