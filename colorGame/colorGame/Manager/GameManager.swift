//
//  SharedManager.swift
//  colorGame
//
//  Created by jebok on 7/13/23.
//

import Foundation
import SwiftUI

class GameManager: ObservableObject {
    // MARK: - PROPERTY
    
    @Published var text: String = "ROLL"
 
    @Published var isRollButtonTapped: Bool = false
    @Published var isSubTokenVisible: Bool = false
    
    @ObservedObject var colorManager = ColorManager()
    @ObservedObject var timerManager = TimerManager()
    @ObservedObject var tokenManager = TokenManager()
    @ObservedObject var bettingManager = BettingManager()
    
    init () {
        bettingManager.selectedBet = Int(tokenManager.tokenText) ?? 0
    }
    
    // MARK: - METHOD/S
    
    func processRoll() {
        isRollButtonTapped = true
        isSubTokenVisible = false
        
        if !timerManager.isTimerRunning {
            withAnimation {
                if timerManager.isTimerRunning {
                    timerManager.stopTimer()
                    
                } else {
                    isRollButtonTapped = false
                    timerManager.startTimer()
                    playSound(sound: "spin", type: "mp3")
                }
            }
        }
    }
    
    func processTimer() {
        if timerManager.isTimerRunning && timerManager.timerCount > 0 {
            text = "ROLLING"
            
            timerManager.timerCount -= 1
            colorManager.changeShapeColor()
            
        } else if timerManager.timerCount == 0 {
            text = "ROLL"
            
            timerManager.stopTimer()
            bettingManager.validateBetWith(colorManager: colorManager)
        }
    }
} //: SharedManager
