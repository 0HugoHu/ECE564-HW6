//
//  CircleText.swift
//  Hugo
//
//  Created by Hugooooo on 10/8/23.
//

import SwiftUI

struct CircleText: View {
    let text: String
    let color: Color
    let isSelected: Bool
    
    var body: some View {
        Text("\(text)")
            .font(.footnote)
            .padding([.leading, .trailing], 10)
            .padding([.top, .bottom], 2)
            .foregroundColor(isSelected ? color : .gray)
            .lineLimit(1)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(isSelected ? color : .gray, lineWidth: 1)
            )
    }
}


struct CircleText_Previews: PreviewProvider {
    static var previews: some View {
        CircleText(text: "Swiftttttt", color: .blue, isSelected: true)
    }
}
