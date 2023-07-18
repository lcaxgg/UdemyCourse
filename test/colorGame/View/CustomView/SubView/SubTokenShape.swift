//
//  SubTokenShape.swift
//  colorGame
//
//  Created by jebok on 7/12/23.
//

import SwiftUI

struct SubTokenShape: View {
    // MARK: - PROPERTY
    
    @StateObject var gameManager: GameManager
    
    // MARK: - BODY
    
    var body: some View {
        ZStack() {
            HStack(spacing: -40.0) {
                BaseTokenShape(tokenName: "greenToken", tokenText: "20", tokenWidth: 110.0, tokenHeight: 110.0)
                    .disabled(true)
                    .padding(.top, 120.0)
                    .overlay(
                        Circle()
                            .fill(Color.clear)
                            .contentShape(Circle())
                            .frame(width: 65.0, height: 65.0)
                            .padding(.top, 117.0)
                            .onTapGesture {
                                playSound(sound: "token", type: "mp3")
                                
                                gameManager.tokenManager.tokenName = "greenToken"
                                gameManager.tokenManager.tokenText = "20"
                                gameManager.bettingManager.selectedBet = 20
                                gameManager.isSubTokenVisible.toggle()
                            }
                    )
                
                BaseTokenShape(tokenName: "redToken", tokenText: "50", tokenWidth: 110.0, tokenHeight: 110.0)
                    .disabled(true)
                    .padding(.top, 120.0)
                    .overlay(
                        Circle()
                            .fill(Color.clear)
                            .contentShape(Circle())
                            .frame(width: 65.0, height: 65.0)
                            .padding(.top, 117.0)
                            .onTapGesture {
                                playSound(sound: "token", type: "mp3")
                                
                                gameManager.tokenManager.tokenName = "redToken"
                                gameManager.tokenManager.tokenText = "50"
                                gameManager.bettingManager.selectedBet = 50
                                gameManager.isSubTokenVisible.toggle()
                            }
                    )
            } //: HStack
            
            HStack(spacing: 35.0) {
                BaseTokenShape(tokenName: "yellowToken", tokenText: "10", tokenWidth: 110.0, tokenHeight: 110.0)
                    .disabled(true)
                    .padding(.top, 120.0)
                    .overlay(
                        Circle()
                            .fill(Color.clear)
                            .contentShape(Circle())
                            .frame(width: 65.0, height: 65.0)
                            .padding(.top, 117.0)
                            .onTapGesture {
                                playSound(sound: "token", type: "mp3")
                                
                                gameManager.tokenManager.tokenName = "yellowToken"
                                gameManager.tokenManager.tokenText = "10"
                                gameManager.bettingManager.selectedBet = 10
                                gameManager.isSubTokenVisible.toggle()
                            }
                    )
                
                BaseTokenShape(tokenName: "blackToken", tokenText: "100", tokenWidth: 110.0, tokenHeight: 110.0)
                    .disabled(true)
                    .padding(.top, 120.0)
                    .overlay(
                        Circle()
                            .fill(Color.clear)
                            .contentShape(Circle())
                            .frame(width: 65.0, height: 65.0)
                            .padding(.top, 117.0)
                            .onTapGesture {
                                playSound(sound: "token", type: "mp3")
                                
                                gameManager.tokenManager.tokenName = "blackToken"
                                gameManager.tokenManager.tokenText = "100"
                                gameManager.bettingManager.selectedBet = 100
                                gameManager.isSubTokenVisible.toggle()
                            }
                    )
            } //: HStack
            .padding(.top, 120.0)
        } //: ZStack
    } //: body
} //: TokenShape

// MARK: - PREVIEW

struct SubTokenShape_Previews: PreviewProvider {
    static var previews: some View {
        SubTokenShape(gameManager: GameManager())
            .previewDevice("iPhone 13 Pro Max")
    }
}
