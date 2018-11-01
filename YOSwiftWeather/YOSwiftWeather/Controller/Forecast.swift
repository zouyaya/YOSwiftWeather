//
//  Forecast.swift
//  OpenWeatherSwift
//
//  Created by Henrik Panhans on 12.02.17.
//  Copyright © 2017 Henrik Panhans. All rights reserved.
//

import UIKit
import Alamofire

class Forecast {
    var _date: String!
    var _weatherType: String!
    var _weatherDescription: String!
    var _highTemp: String!
    var _lowTemp: String!
    
    var date: String {
        if _date == nil {
            _date = ""
        }
        return _date
    }
    
    var weatherType: String {
        if _weatherType == nil {
            _weatherType = ""
        }
        return _weatherType
    }
    
    var weatherDescription: String {
        if _weatherDescription == nil {
            _weatherDescription = ""
        }
        return _weatherDescription
    }
    
    var highTemp: String {
        if _highTemp == nil {
            _highTemp = ""
        }
        return _highTemp
    }
    
    var lowTemp: String {
        if _lowTemp == nil {
            _lowTemp = ""
        }
        return _lowTemp
    }
    
    init(weatherDict: Dictionary<String, AnyObject>) {
        if let temp = weatherDict["temp"] as? Dictionary<String, AnyObject> {
            
            if let min = temp["min"] {
                self._lowTemp = "\(min)"
            }
            
            if let max = temp["max"] {
                self._highTemp = "\(max)"
            }
        }
        
        if let weather = weatherDict["weather"] as? [Dictionary<String, AnyObject>] {
            
            if let main = weather[0]["main"] as? String {
                self._weatherType = main
            }
            if let main = weather[0]["description"] as? String {
                self._weatherDescription = main
            }
        }
        
        if let date = weatherDict["dt"] as? Double {
            
            let unixConvertedDate = Date(timeIntervalSince1970: date)
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .full
            dateFormatter.dateFormat = "EEEE"
            dateFormatter.timeStyle = .none
            dateFormatter.locale = Locale(identifier: "fr_FR")
            self._date = unixConvertedDate.dayOfTheWeek().capitalized
        }
    }
}

extension Date {
    func dayOfTheWeek() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        dateFormatter.locale = Locale(identifier: "fr_FR")
        return dateFormatter.string(from: self)
    }
}
