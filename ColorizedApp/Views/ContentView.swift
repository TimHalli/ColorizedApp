//
//  ContentView.swift
//  ColorizedApp
//
//  Created by Tim Halli on 16/12/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var sliderValues: [Double] = [
        Double.random(in: 0...255),
        Double.random(in: 0...255),
        Double.random(in: 0...255)
    ]
    @State private var textFieldValues = Array(repeating: "", count: 3)
    @State private var accentColors = [Color.red, .green, .blue]
    @State private var currentColor = Color.black
    @State private var alertPresented = false
    
    var body: some View {
        ZStack {
            GeometryReader { geometry in
                Image("sketch")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .clipped()
            }
            .edgesIgnoringSafeArea(.all)
            .alert(isPresented: $alertPresented) {
                Alert(
                    title: Text("Invalid Value"),
                    message: Text("Value should be between 0 and 255"),
                    dismissButton: .default(Text("OK"))
                )
            }
            
            VStack {
                ExtractedView(currentColor: $currentColor)
                
                ForEach (0..<sliderValues.count, id: \.self) { index in
                    SliderView(
                        sliderValue: $sliderValues[index],
                        textFieldValue: $textFieldValues[index],
                        accentColor: accentColors[index]
                    )
                }
                Spacer()
            }
            .keyboardType(.numberPad)
            .toolbar{
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button("Done") {
                        applyChanges()
                    }
                }
            }
            .onAppear {
                updateColor()
            }
        }
    }
    
    private func updateColor() {
        currentColor = Color(
            red: sliderValues[0] / 255,
            green: sliderValues[1] / 255,
            blue: sliderValues[2] / 255
        )
        textFieldValues = sliderValues.map { "\(Int($0))" }
    }
   
    private func applyChanges() {
        for index in 0..<textFieldValues.count {
            
            guard let intValue = Int(textFieldValues[index]), (0...255).contains(intValue) else {
                alertPresented = true
                return
            }
            withAnimation {
                sliderValues[index] = Double(intValue)
            }
        }
        textFieldValues = sliderValues.map { "\(Int($0))" }
    }

}

#Preview {
    ContentView()
}
