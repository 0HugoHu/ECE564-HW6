//
//  Badge.swift
//  Hugo
//
//  Created by Hugooooo on 10/19/23.
//

import Foundation
import SwiftUI

struct Badge: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0.5*width, y: 0.01039*height))
        path.addCurve(to: CGPoint(x: 0.01034*width, y: 0.50005*height), control1: CGPoint(x: 0.22999*width, y: 0.01039*height), control2: CGPoint(x: 0.01034*width, y: 0.23004*height))
        path.addCurve(to: CGPoint(x: 0.5*width, y: 0.98971*height), control1: CGPoint(x: 0.01034*width, y: 0.77006*height), control2: CGPoint(x: 0.22999*width, y: 0.98971*height))
        path.addCurve(to: CGPoint(x: 0.98966*width, y: 0.50005*height), control1: CGPoint(x: 0.77001*width, y: 0.98971*height), control2: CGPoint(x: 0.98966*width, y: 0.77006*height))
        path.addCurve(to: CGPoint(x: 0.5*width, y: 0.01039*height), control1: CGPoint(x: 0.98966*width, y: 0.23004*height), control2: CGPoint(x: 0.77001*width, y: 0.01039*height))
        path.closeSubpath()
        return path
    }
}

func randomColor() -> Color {
    let red = Double.random(in: 0.5...0.95)
    let green = Double.random(in: 0.5...0.95)
    let blue = Double.random(in: 0.5...0.95)
        return Color(red: red, green: green, blue: blue)
}

func randomColorDark() -> Color {
    let red = Double.random(in: 0.0...0.4)
    let green = Double.random(in: 0.0...0.4)
    let blue = Double.random(in: 0.0...0.4)
        return Color(red: red, green: green, blue: blue)
}


struct Badge_Previews: PreviewProvider {
    static var previews: some View {
        Badge()
            .fill(randomColor())
            .frame(width: 100, height: 100)
    }
}
