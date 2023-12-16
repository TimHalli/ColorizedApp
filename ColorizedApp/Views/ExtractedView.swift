//
//  ExtractedView.swift
//  ColorizedApp
//
//  Created by Tim Halli on 16/12/2023.
//

import SwiftUI

struct ExtractedView: View {
    @Binding var currentColor: Color
    
    var body: some View {
        RoundedRectangle(cornerRadius: 15)
            .stroke(.white, lineWidth: 4)
            .background(
                RoundedRectangle(cornerRadius: 8)
                    .fill(currentColor)
            )
            .frame(height: 200)
            .padding()
    }
}
