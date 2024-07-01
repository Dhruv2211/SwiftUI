//
//  ContentView.swift
//  Weather
//
//  Created by Dhruv Pujara on 17/04/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var locationManager = LocationManager()
    
    var body: some View {
        VStack{
            
            if let location = locationManager.location {
                Text("Your coodinates are:  \(location.latitude), \(location.longitude)")
                     
            }else{
                if locationManager.isLoading{
                    LoadingView()
                    
                }else{
                    WelcomeView().environmentObject(locationManager)
                }
            }
        
           
        }
        .background(Color(hue: 0.681, saturation: 0.85, brightness: 0.558)).preferredColorScheme(.dark)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
