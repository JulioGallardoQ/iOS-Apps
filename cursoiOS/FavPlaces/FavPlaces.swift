//
//  FavPlaces.swift
//  cursoiOS
//
//  Created by Julio Cesar Gallardo Quintero on 24/01/2025.
//

import SwiftUI
import MapKit

struct FavPlaces: View {
    @State var position = MapCameraPosition.region(<#T##region: MKCoordinateRegion##MKCoordinateRegion#>)
    var body: some View {
        ZStack {
            MapReader{ proxy in
            Map()
                    .onTapGesture {
                        
                    }
            }
            
        }
    }
}

#Preview {
    FavPlaces()
}
