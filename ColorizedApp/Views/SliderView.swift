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
                .padding(5)
                .frame(width: 50)
            
            Slider(value: $sliderValue, in: 0...255, step: 1)
                .accentColor(accentColor)
            
            TextField("0", text: $textFieldValue)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .frame(width: 50)
                .padding(15)
        }
    }
}
