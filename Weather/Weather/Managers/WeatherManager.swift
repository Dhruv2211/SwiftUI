//
//  WeatherManager.swift
//  Weather
//
//  Created by Dhruv Pujara on 17/04/22.
//

import Foundation
import CoreLocation

class WeatherManager{
    func getCurrentWeather(latitutde: CLLocationDegrees, longitude: CLLocationDegrees) async throws{
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?lat=\(latitutde)&lon=\(longitude)&appid={1fb037910a064fe01809e3fd2ceab4dd}&units=metric") else {
            fatalError("Missing URL")}
            
            let urlRequest = URLRequest(url: url)
            
            
            let (data, response) = try await URLSession.shared.data(for: urlRequest)
            
            guard (response as? HTTPURLResponse)
        
        }
        
    }
    

