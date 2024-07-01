//
//  WeatherManger.swift
//  Clima
//
//  Created by Dhruv Pujara on 22/06/24.
//  Copyright © 2024 App Brewery. All rights reserved.
//

import Foundation
import CoreLocation

protocol weatherMangerDelegate{
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel)
    func didFailWithError(error: Error)
}

struct WeatherManager{
    let link = "https://api.openweathermap.org/data/2.5/weather?&appid=1fb037910a064fe01809e3fd2ceab4dd&units=metric"
  
    var delegate: weatherMangerDelegate?
    
    func fetchWeather(cityname: String){
        let urlString = "\(link)&q=\(cityname)"
      
        performRequest(with: urlString)
    }
    
    func fetchWeather(latitude: CLLocationDegrees, longitude: CLLocationDegrees){
        let urlString = "\(link)&lon=\(longitude)&lat=\(latitude)"
        
        performRequest(with: urlString)
    }
    func performRequest(with urlString: String){
        //Creating URL
        
        if let url = URL(string: urlString){
            //Creating URL Session
            
            let session = URLSession(configuration: .default)
            
            // Give session a task
            //let task = session.dataTask(with: url, completionHandler: handle(data:response:error:))
            //changing the code to a closure
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil{
                   // print(error!)
                    self.delegate?.didFailWithError(error: error!)
                    return
                }
                
                if let safeData = data{
                    //let dataString = String(data: safeDate, encoding: .utf8)
                    //print(dataString)
                    if let weather = self.parseJson(safeData){
                        self.delegate?.didUpdateWeather(self, weather: weather)
                    }
                }
            }
            
            //Start task
            task.resume()
        }
        
    }
    
    func parseJson(_ weatherData: Data) -> WeatherModel?{
        let decoder = JSONDecoder()
        
        do{
          let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            let temp = decodedData.main.temp
            let name = decodedData.name
            let id = decodedData.weather[0].id
            //print(getConditionName(weatherId: weatherId))
            
            let weatherModel = WeatherModel(conditionId: id, cityName: name, temperature: temp)
            
            return weatherModel
          //  print(weatherModel.temperatureString)
        }
        catch{
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
    
   
    
  
}



/* Moved the code above in the closure.
func handle(data: Data?, response: URLResponse?, error: Error?){
    if error != nil{
        print(error!)
        return
    }
    
    if let safeDate = data{
        let dataString = String(data: safeDate, encoding: .utf8)
        print(dataString)
    }
}*/
