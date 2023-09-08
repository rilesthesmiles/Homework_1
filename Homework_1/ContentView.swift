//
//  ContentView.swift
//  Homework_1
//
//  Created by Riley Marshall on 9/5/23.
//

import SwiftUI
import MapKit

struct ContentView: View {
    var formatter = NumberFormatter()
    @State var latValue = "40.2503"
    @State var longValue = "-111.65231"
    @State var mapRegion = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 40, longitude: -111),
        span: MKCoordinateSpan(latitudeDelta: 100, longitudeDelta: 100))
    
    
    var body: some View {
        VStack {
            HStack{
                TextField("Latitude", text: $latValue)
                TextField("Longitude", text: $longValue)
                Button("Map It"){
                    updateMapRegion()
                }
            }
            .padding(.horizontal, 30)
            
            Map(coordinateRegion: $mapRegion)
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                .onAppear{
                    updateMapAppearance()
                }
        }
        
    }
    func updateMapAppearance(){
        let map = MKMapView.appearance()
        
        map.mapType = .satellite
        map.showsTraffic = true
        map.showsBuildings = true
        map.showsScale = true
        map.isRotateEnabled = true
    }
    
    func updateMapRegion(){

        withAnimation{
            if let latitude = formatter.number(from: latValue),
               let longitude = formatter.number(from: longValue){
                
                mapRegion.center = CLLocationCoordinate2D(latitude: latitude.doubleValue, longitude: longitude.doubleValue)
                mapRegion.span.latitudeDelta = 0.015
                mapRegion.span.longitudeDelta = 0.015
            }
        }
            
        
       
    }
}

#Preview {
    ContentView()
}
