//
//  ContentView.swift
//  Bullseye with SwiftUI
//
//  Created by Tony Hong on 2/17/22.
//

import SwiftUI

struct ContentView: View {
    @State var sliderValue: Double = 50;
    @State var toggle = false
    var body: some View {
        HStack(){
            
            VStack() {
                Text("High Score")
                Text("0")
            }
            .padding(.leading,20)
            .padding(.top,20)
            
            Spacer()
            
            VStack() {
                Text("Current Level")
                Text("1")
            }
            .padding(.trailing,20)
            .padding(.top,20)
            
        }
        Spacer()
        
    
        VStack() {
            Spacer()
            Text("Move the slider to")
                .font(.system(size: 30))
            Text("25")
                .font(.system(size: 30))
            Slider(value: $sliderValue, in: 0...100)
            Button(action:{
                print("tapped")
            }){
                Text("Check")
            }
            .padding(.trailing,20)
            .padding(.leading,20)
            
            Spacer()
            Text("Exact Mode?")
            Toggle("Exact Mode?",isOn:$toggle)
            .labelsHidden()
            .padding(.bottom,20)
            .padding(.trailing,30)
            .padding(.leading,20)
            
        }
        
    }
}

