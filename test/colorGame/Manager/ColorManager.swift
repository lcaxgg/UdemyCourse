//
//  ColorManager.swift
//  colorGame
//
//  Created by jebok on 7/6/23.
//

import Foundation
import SwiftUI

class ColorManager: ObservableObject {
    // MARK: - PROPERTY
    
    @Published var firstColor: Color = .green
    @Published var secondColor: Color = .green
    @Published var thirdColor: Color = .green
    
    private let colors: [Color] = [.yellow, .white, .purple, .blue, .red, .green]
    
    // MARK: - METHOD/S
    
    func changeShapeColor() {
        firstColor = colors.randomElement() ?? .green
        secondColor = colors.randomElement() ?? .green
        thirdColor = colors.randomElement() ?? .green
    }
}
