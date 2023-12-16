//
//  SliderColorView.swift
//  ColorizedApp
//
//  Created by Tim Halli on 16/12/2023.
//

import SwiftUI

struct SliderView: View {
    @Binding var sliderValue: Double
    @Binding var textFieldValue: String
    
    var accentColor: Color
    
    var body: some View {
        HStack {
            Text("\(Int(sliderValue))")
                .bold()
                .foregroundColor(.white)
                .padding(15)
            
            Slider(value: $sliderValue, in: 0...255, step: 1)
                .accentColor(accentColor)
                .onChange(of: sliderValue) { newValue, _ in
                    textFieldValue = "\(Int(newValue))"
                }
            
            TextField("", text: $textFieldValue)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .frame(width: 50)
                .padding(15)
        }
    }
}
