//
//  WeatherRealm.swift
//  Weather
//
//  Created by Narine Balasanyan on 10/6/17.
//  Copyright © 2017 Nar9. All rights reserved.
//

import Foundation
import RealmSwift

class WeatherRealm: Object {
    @objc dynamic var cityName = ""
    @objc dynamic var country = ""
    @objc dynamic var date = ""
    @objc dynamic var weather = ""
    @objc dynamic var icon = ""
    @objc dynamic var minTemp = ""
    @objc dynamic var maxTemp = ""
}
