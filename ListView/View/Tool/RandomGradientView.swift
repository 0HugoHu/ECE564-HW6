//
//  RandomGradientView.swift
//  Hugo
//
//  Created by Hugooooo on 10/9/23.
//

import SwiftUI

struct RandomGradientView: View {
    var body: some View {
        let startColor = randomBeautifulColor()
        var endColor = randomBeautifulColor()
        
        while startColor == endColor {
            endColor = randomBeautifulColor()
        }
        
        return LinearGradient(
            gradient: Gradient(colors: [startColor, endColor]),
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
        .ignoresSafeArea()
    }
    
    func randomBeautifulColor() -> Color {
        let beautifulColors: [Color] = [
            Color(red: 0.0, green: 0.6, blue: 0.8).opacity(0.4),  // Light Blue
            Color(red: 0.9, green: 0.2, blue: 0.4).opacity(0.4),  // Red
            Color(red: 0.0, green: 0.8, blue: 0.4).opacity(0.4),  // Green
            Color(red: 0.9, green: 0.4, blue: 0.0).opacity(0.4),  // Orange
            Color(red: 0.6, green: 0.0, blue: 0.6).opacity(0.4),  // Purple
            Color(red: 0.1, green: 0.7, blue: 0.5).opacity(0.4),  // Teal
            Color(red: 0.7, green: 0.3, blue: 0.6).opacity(0.4),  // Magenta
            Color(red: 0.3, green: 0.7, blue: 0.3).opacity(0.4),  // Lime Green
        ]
        
        return beautifulColors.randomElement() ?? .blue
    }
}

struct RandomGradientView_Previews: PreviewProvider {
    static var previews: some View {
        RandomGradientView()
    }
}

