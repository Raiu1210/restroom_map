//
//  ContentView.swift
//  restroom_map
//
//  Created by raiu on 2020/02/19.
//  Copyright © 2020 Ryu Ishibashi. All rights reserved.
//

import SwiftUI
import MapKit

struct ContentView: View {
    @State var manager = CLLocationManager()
    @State var alert = false
    
    var body: some View {
        VStack {
            Map(manager:$manager, alert:$alert).alert(isPresented:$alert) {
                Alert(title: Text("Please enable location access"))
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
