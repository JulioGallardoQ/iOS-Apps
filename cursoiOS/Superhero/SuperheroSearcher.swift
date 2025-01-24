//
//  SuperheroSearcher.swift
//  cursoiOS
//
//  Created by Julio Cesar Gallardo Quintero on 01/01/2025.
//

import SwiftUI
import SDWebImageSwiftUI

struct SuperheroSearcher: View {
    @State var superheroName: String = ""
    @State var wrapper:ApiNetwork.Wrapper? = nil
    @State var loading: Bool = false
    var body: some View {
        VStack{
            TextField("", text: $superheroName, prompt: Text("Type Superhero Name...").font(.title).bold().foregroundColor(.gray)).foregroundColor(.white)
                .bold()
                .padding(16)
                .border(.purple, width: 1.5)
                .padding(8)
                .autocorrectionDisabled()
                .onSubmit {
                    loading = true
                    print(superheroName)
                    Task{
                        do {
                            wrapper = try await ApiNetwork().getHeroesByQuery(query: superheroName)
                        }catch {
                            print("Error")
                        }
                        loading = false
                    }
                    
                    
                }
            //condition to add the progressView when searching for something
            if loading {
                ProgressView().tint(.white)
            }
            NavigationStack{
                List( wrapper?.results ?? []){
                superhero in
                    ZStack{//this with help us to put superheroItem on the navigationlink but making the link clickable
                    SuperheroItem(superhero: superhero)
                        NavigationLink(destination:SuperheroDetail(id: superhero.id)){EmptyView()}.opacity(0)
                    }.listRowBackground(Color.backgroundApp)
                    
            }.listStyle(.plain)
            }
            Spacer()
        }.frame(maxWidth: .infinity, maxHeight: .infinity).background(.backgroundApp)
    }
}

struct SuperheroItem:View {
    let superhero:ApiNetwork.Superhero
    var body: some View {
        ZStack{
            WebImage(url: URL(string: superhero.image.url))
                .resizable()
                .indicator(.activity)//charge image with progress bar
                .scaledToFill()
                .frame(height:200)
            
            VStack{
                Spacer()
                Text(superhero.name).foregroundColor(.white)
                    .font(.title)
                    .bold()
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(.white.opacity(0.5))
            }
        }.frame(height:200).cornerRadius(32)
    }
}

#Preview {
    SuperheroSearcher()
}
