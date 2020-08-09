//
//  WeatherData.swift
//  HomeWork12
//
//  Created by Albert on 03.08.2020.
//  Copyright © 2020 Albert. All rights reserved.
//

import Foundation

class WeatherData {//класс погоды
    let temperature : Double//температура
    let humidity : Double //влажность
    let pressure : Double //давление
    let windSpeed : Double //Скорость ветра
    let windDegree : Double //направление ветра
    let weather : String //погода
    let description : String //описание погоды
    let icon : String //иконка погоды
    
    init?(_ data: NSDictionary){
        guard let weather = data["weather"] as? [NSDictionary] // Dictionary<String, Any> вот тут похоже может вылезти много ошибок в будущем
            else{
                return nil
        }

        let main = data["main"] as? NSDictionary
        let wind = data["wind"] as? NSDictionary
        
        let weatherOne = weather[0]
        self.weather = weatherOne["main"] as! String //слишком лихо сразу в строку, а если не получится? либо делать через guard?
        self.description = weatherOne["description"] as! String
        self.icon = weatherOne["icon"] as! String

        if main != nil {//текущий прогноз
            self.temperature = main!["temp"] as! Double
            self.humidity = main!["humidity"] as! Double
            self.pressure = main!["pressure"] as! Double
        }
        else{//иначе список прогнозов, и тут немного другая структура
            let temp = data["temp"] as! NSDictionary
            self.temperature = temp["day"] as! Double
            self.humidity = data["humidity"] as! Double
            self.pressure = data["pressure"] as! Double
        }
        
        if wind != nil{
            self.windSpeed = wind!["speed"] as! Double
            self.windDegree = wind!["deg"] as! Double
        }
        else{
            self.windSpeed = data["speed"] as! Double
            self.windDegree = data["deg"] as! Double
        }
    }
}
