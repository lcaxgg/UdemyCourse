//
//  TokenShape.swift
//  colorGame
//
//  Created by jebok on 7/7/23.
//

import SwiftUI

struct MainTokenShape: View {
    // MARK: - PROPERTY

    @StateObject var gameManager: GameManager
    @State private var isTokenTapped: Bool = false
    
    // MARK: - BODY
    
    var body: some View {
        ZStack {
            BaseTokenShape(tokenName: gameManager.tokenManager.tokenName, tokenText: gameManager.tokenManager.tokenText, tokenWidth: 130.0, tokenHeight: 130.0)
                .scaleEffect(isTokenTapped ? 0.90 : 1.0)
                .opacity(gameManager.isSubTokenVisible ? 0.9 : 1.0)
                .gesture(
                    TapGesture()
                        .onEnded { _ in
                            playSound(sound: "token", type: "mp3")
                            gameManager.isSubTokenVisible.toggle()
                            isTokenTapped = true
                           
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                                isTokenTapped = false
                            }
                        }
                )
        } //: ZStack
    } //: body
} //: TokenShape

// MARK: - PREVIEW

struct MainTokenShape_Previews: PreviewProvider {
    static var previews: some View {
        MainTokenShape(gameManager: GameManager())
            .previewDevice("iPhone 13 Pro Max")
    }
}
