//
//  Constants.swift
//  SimpleWeather

import Foundation

typealias DownloadComplete = () -> ()

let CURRENT_WEATHER_URL = "http://api.openweathermap.org/data/2.5/weather?lat=\(Location.sharedInstance.latitude!)&lon=\(Location.sharedInstance.longitude!)&appid=42a1771a0b787bf12e734ada0cfc80cb"
