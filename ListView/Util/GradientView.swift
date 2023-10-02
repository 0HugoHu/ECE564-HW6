//
//  GradientView.swift
//  Hugo
//
//  Created by Hugooooo on 9/20/23.
//

import Foundation
import UIKit

func addGradientBackground(to view: UIView, fromColor color1: CGColor, toColor color2: CGColor) {
    // Create a gradient layer
    let gradientLayer = CAGradientLayer()

    // Define the colors for the gradient (you can change these colors)
    gradientLayer.colors = [color1, color2]
    gradientLayer.locations = [0.0, 1.0]

    // Specify the gradient's start and end points (you can adjust these)
    gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
    gradientLayer.endPoint = CGPoint(x: 0.0, y: 1.0)

    // Set the frame of the gradient layer to match the view's frame
    gradientLayer.frame = view.bounds

    // Add the gradient layer to the view's layer as a sublayer
    view.layer.insertSublayer(gradientLayer, at: 0)
}
