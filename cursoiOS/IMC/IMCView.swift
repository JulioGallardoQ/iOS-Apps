//
//  IMCView.swift
//  cursoiOS
//
//  Created by Julio Cesar Gallardo Quintero on 21/12/2024.
//

import SwiftUI

struct IMCView: View {
    //init(){
     //   UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white]
    //}
    @State var gender:Int = 0
    @State var height:Double = 150
    @State var age:Int = 18
    @State var weight:Int = 80
    
    var body: some View {
        VStack{
            HStack{
                TooggleButton(text: "Hombre", imageName: "heart.fill", gender: 0, selectedGender: $gender)
                TooggleButton(text: "Mujer", imageName: "star.fill", gender: 1, selectedGender: $gender)
            }
            HeightCalculator(selectedHeight: $height)
            
            HStack {
                counter(text: "Edad", number: $age)
                counter(text: "Peso", number: $weight)
            }
            calculationButton(userWeight: Double(weight), userHeight: height)
            
        }.frame(maxWidth: .infinity,maxHeight: .infinity).background(.backgroundApp)
            
            .toolbar{
                ToolbarItem(placement: .principal ){
                    Text("IMC Calculator").bold().foregroundColor(.white)
                }
            }
            //.navigationBarBackButtonHidden()
    }
}

struct TooggleButton:View {
    let text:String
    let imageName:String
    let gender: Int
    @Binding var selectedGender:Int
    
    
    var body: some View{
        
        let color = if( gender == selectedGender){
            Color.backgroundCompSelected
        }else{
            Color.backgroundComponent
        }
        
        
        Button (action: {
            selectedGender = gender
        }){
            VStack{
                Image(systemName: imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 100)
                    .foregroundColor(.white)
                InformationText(text: text)
            }.frame(maxWidth: .infinity,maxHeight: .infinity)
                .background(color)
        }
    }
    
}

struct InformationText:View {
    let text:String
    var body: some View {
        
        Text(text).font(.largeTitle).bold().foregroundColor(.white)
    }
}
struct TitleText:View {
    let text:String
    var body: some View {
        Text(text).font(.title2).foregroundColor(.gray)
    }
}
struct HeightCalculator:View {
    @Binding var selectedHeight:Double
    var body: some View {
        VStack{
            TitleText(text: "Altura")
            InformationText(text: "\(Int(selectedHeight)) cm")
            Slider(value:$selectedHeight , in:100...220, step:1).accentColor(.purple).padding(.horizontal,16)
        }.frame(maxWidth: .infinity, maxHeight: .infinity).background(.backgroundComponent)
    }
}

struct counter:View {
    let text:String
    @Binding var number:Int
    var body: some View {
        
        VStack{
            TitleText(text: text)
            InformationText(text: String(number))
            HStack{
                Button(action:{
                    if (number > 0) {
                        number -= 1
                    }
                }){
                    ZStack{
                        Circle()
                            .frame(width: 70,height: 70)
                            .foregroundColor(.purple)
                        Image(systemName: "minus")
                            .resizable()
                            .scaledToFit()
                            .foregroundColor(.white)
                            .frame(width: 25,height: 25)
                    }
                }
                Button(action:{
                    if (number < 100){
                        number += 1
                    }
                    
            
                }){
                    ZStack{
                        Circle()
                            .frame(width: 70,height: 70)
                            .foregroundColor(.purple)
                        Image(systemName: "plus")
                            .resizable()
                            .foregroundColor(.white)
                            .frame(width: 25,height: 25)
                    }
                }
            }
        }.frame(maxWidth: .infinity, maxHeight: .infinity).background(.backgroundComponent)
    }
}
    
    struct calculationButton:View {
        let userWeight:Double
        let userHeight:Double
        var body: some View {
                NavigationStack{
                    NavigationLink(destination:{IMCResult(userWeight: userWeight, userHeight: userHeight)}){
                        Text("Calcular").font(.title).bold().foregroundColor(.purple).frame(maxWidth: .infinity, maxHeight: 100).background(.backgroundComponent)
                    }
                }
          
        }
    }
        
        #Preview {
            //TooggleButton(text: "Hombre", imageName: "heart.fill", index: 0)
            IMCView()
        }
    
