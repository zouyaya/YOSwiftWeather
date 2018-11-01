//
//  Constant.swift
//  YOSwiftWeather
//
//  Created by yangou on 2018/11/1.
//  Copyright © 2018年 hello. All rights reserved.
//

import Foundation

let BASE_URL = "http://api.openweathermap.org/data/2.5/weather"
let WEATHER_CITY = "?q=Paris%2Cfr"
let APP_ID = "&appid="
let API_KEY = "7214cf37e4564876f94c3436c2d4c0e9"
let UNIT = "&units=metric"
let LANG = "&lang=fr"

typealias DownloadComplete = () -> ()

let CURRENT_WEATHER_URL = "\(BASE_URL)\(WEATHER_CITY)\(APP_ID)\(API_KEY)\(UNIT)\(LANG)"
let FORECAST_URL = "http://api.openweathermap.org/data/2.5/forecast/daily?q=Paris%2Cfr&cnt=5&mode=json&appid=7214cf37e4564876f94c3436c2d4c0e9&units=metric&lang=fr"
