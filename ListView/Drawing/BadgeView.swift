//
//  BadgeView.swift
//  Hugo
//
//  Created by Hugooooo on 10/19/23.
//

import SwiftUI

enum Icon: String {
    case Golf = "Golf"
    case Swimming = "Swimming"
    case Game = "Game"
    case Badminton = "Badminton"
    case Singing = "Singing"
    case Music = "Music"
    case Gym = "Gym"
    case Cooking = "Cooking"
    case Movie = "Movie"
    case Hiking = "Hiking"
    case Sports = "Sports"
    case Java = "Java"
    case Python = "Python"
    case CPlus = "C+"
    case C = "C"
    case JavaScript = "JavaScript"
    case Swift = "Swift"
    case Languages = "Languages"
}


struct AnyShape: Shape {
    init<S: Shape>(_ wrapped: S, fill: Color) {
        _path = { rect in
            var path = wrapped.path(in: rect)
            return path
        }
    }
    
    func path(in rect: CGRect) -> Path {
        return _path(rect)
    }
    
    private let _path: (CGRect) -> Path
}

struct BadgeView: View {
    let numberOfBadges = 5
    let radius: Double
    let icon: Icon
    let height: Double
    let width: Double
    
    init(icon: Icon, height: Double, width: Double) {
        self.height = height
        self.width = width
        self.icon = icon
        self.radius = height / 4.0
    }
    
    func getShape() -> some Shape {
        switch icon {
        case .Golf:
            return AnyShape(Golf(), fill: randomColorDark())
        case .Swimming:
            return AnyShape(Swimming(), fill: randomColorDark())
        case .Game:
            return AnyShape(Game(), fill: randomColorDark())
        case .Badminton:
            return AnyShape(Badminton(), fill: randomColorDark())
        case .Singing:
            return AnyShape(Singing(), fill: randomColorDark())
        case .Music:
            return AnyShape(Music(), fill: randomColorDark())
        case .Gym:
            return AnyShape(Gym(), fill: randomColorDark())
        case .Cooking:
            return AnyShape(Cooking(), fill: randomColorDark())
        case .Movie:
            return AnyShape(Movie(), fill: randomColorDark())
        case .Hiking:
            return AnyShape(Hiking(), fill: randomColorDark())
        case .Sports:
            return AnyShape(Sports(), fill: randomColorDark())
        case .Java:
            return AnyShape(Java(), fill: randomColorDark())
        case .Python:
            return AnyShape(Python(), fill: randomColorDark())
        case .CPlus:
            return AnyShape(CPlus(), fill: randomColorDark())
        case .C:
            return AnyShape(C(), fill: randomColorDark())
        case .JavaScript:
            return AnyShape(JavaScript(), fill: randomColorDark())
        case .Swift:
            return AnyShape(Swift(), fill: randomColorDark())
        case .Languages:
            return AnyShape(Languages(), fill: randomColorDark())
        }
    }
    
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundStyle(Color.white)
                .clipShape(Circle())
                .frame(width: width * 1.5, height: height * 1.5)
                .shadow(color: Color.black.opacity(0.2), radius: 4, x: 0, y: 3)
            
            ForEach(0..<numberOfBadges, id: \.self) { index in
                let angle = 2 * .pi / Double(numberOfBadges) * Double(index)
                let x = radius * CGFloat(cos(angle))
                let y = radius * CGFloat(sin(angle))
                
                
                Badge()
                    .fill(randomColor())
                    .frame(width: width, height: height)
                    .offset(x: x, y: y)
                    .opacity(0.5)
            }
            getShape()
                .frame(width: width * 0.85, height: height * 0.85)
                .foregroundStyle(randomColorDark())
                .opacity(0.8)
            
        }
    }
}

#Preview {
    BadgeView(icon: .Golf, height: 100, width: 100)
}
