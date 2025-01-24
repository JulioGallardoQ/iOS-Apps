//
//  ContentView.swift
//  cursoiOS
//
//  Created by Julio Cesar Gallardo Quintero on 19/12/2024.
//

import SwiftUI

struct Exercise1: View {
    var body: some View {
        VStack {
            HStack {
                Rectangle()
                    .foregroundColor(.blue)
                    .frame(height: 70)
                Rectangle()
                    .foregroundColor(.orange)
                    .frame(height: 70)
                Rectangle()
                    .foregroundColor(.yellow)
                    .frame(height: 70)
            }
            Rectangle()
                .foregroundColor(.orange)
                .frame(height: 90)
            HStack {
                Circle()
                    .foregroundColor(.green)
                Rectangle()
                    .frame(height: 300)
                Circle()
                    .foregroundColor(.purple)
            }
            
            Rectangle()
                .foregroundColor(.orange)
                .frame(height: 90)
            HStack {
                Rectangle()
                    .foregroundColor(.blue)
                    .frame(height: 70)
                Rectangle()
                    .foregroundColor(.orange)
                    .frame(height: 70)
                Rectangle()
                    .foregroundColor(.yellow)
                    .frame(height: 70)
            }
            
        }
        .background(.red)
        .padding()
    }
}

#Preview {
    Exercise1()
}
