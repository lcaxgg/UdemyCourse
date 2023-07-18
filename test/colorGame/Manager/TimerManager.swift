//
//  TimerManager.swift
//  colorGame
//
//  Created by jebok on 7/6/23.
//

import Foundation

class TimerManager: ObservableObject {
    // MARK: - PROPERTY
    
    @Published var timerCount = 0
    @Published var isTimerRunning = false
    @Published var timer: Timer.TimerPublisher?
    
    // MARK: - METHOD/S
    
    func startTimer() {
        timer = Timer.TimerPublisher(interval: 0.1, runLoop: .main, mode: .default)
        _ = timer?.connect()
     
        timerCount = 7
        isTimerRunning = true
    }
    
    func stopTimer() {
        timer?.connect().cancel()
        timer = nil
        
        isTimerRunning = false
    }
}
