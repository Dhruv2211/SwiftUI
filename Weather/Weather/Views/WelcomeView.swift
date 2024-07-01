//
//  WelcomeView.swift
//  Weather
//
//  Created by Dhruv Pujara on 17/04/22.
//

import SwiftUI
import CoreLocationUI

struct WelcomeView: View {
    @EnvironmentObject var locationManager: LocationManager
    
    var body: some View {
        VStack{
            VStack(spacing: 20){
                Text("Welcome to weather app").bold().font(.title)
                
                Text("Please share you current location").padding()
            }.multilineTextAlignment(.center).padding()
            
            LocationButton(.shareCurrentLocation){
                locationManager.requestLocation()
            }.cornerRadius(30).symbolVariant(.fill).foregroundColor(.white)
            
            
        }.frame(width: .infinity, height: .infinity)
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
