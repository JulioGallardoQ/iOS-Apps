//
//  MenuView.swift
//  cursoiOS
//
//  Created by Julio Cesar Gallardo Quintero on 21/12/2024.
//

import SwiftUI

struct MenuView: View {
    var body: some View {
        NavigationStack{
            List{
                NavigationLink(destination:IMCView()){
                    Text("IMC  Calculator")
                }
                NavigationLink(destination:SuperheroSearcher()){
                    Text("Superhero finder")
                }
                NavigationLink(destination:FavPlaces()){
                    Text("Favorite Places")
                }
            }
        }
    }
}

#Preview {
    MenuView()
}
