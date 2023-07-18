//
//  MainRectangleShape.swift
//  colorGame
//
//  Created by OPSolutions on 7/14/23.
//

import SwiftUI

struct MainRectangleShape: View {
    // MARK: - PROPERTY
    
    @ObservedObject var gameManager: GameManager
    
    // MARK: - BODY

    var body: some View {
        VStack {
            HStack(spacing: 5.0) {
                BaseRectangleShape(shapeColor: gameManager.colorManager.firstColor)
                BaseRectangleShape(shapeColor: gameManager.colorManager.secondColor)
                BaseRectangleShape(shapeColor: gameManager.colorManager.thirdColor)
            }
        } //: ZStack
    } //: body
} //: MainRectangleShape

// MARK: - PREVIEW

struct MainRectangleShape_Previews: PreviewProvider {
    static var previews: some View {
        MainRectangleShape(gameManager: GameManager())
    }
}
