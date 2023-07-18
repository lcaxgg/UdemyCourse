//
//  BettingManager.swift
//  colorGame
//
//  Created by jebok on 7/6/23.
//

import Foundation
import SwiftUI

class BettingManager: ObservableObject {
    // MARK: - PROPERTY
    
    @Published var balance: Int = 10000
    @Published var selectedBet: Int = 100
    @Published var yellowBet: Int = 0
    @Published var whiteBet: Int = 0
    @Published var purpleBet: Int = 0
    @Published var blueBet: Int = 0
    @Published var redBet: Int = 0
    @Published var greenBet: Int = 0
    
    @Published var yellowPrize: String = AppConstant.EMPTY_STRING
    @Published var whitePrize: String = AppConstant.EMPTY_STRING
    @Published var purplePrize: String = AppConstant.EMPTY_STRING
    @Published var bluePrize: String = AppConstant.EMPTY_STRING
    @Published var redPrize: String = AppConstant.EMPTY_STRING
    @Published var greenPrize: String = AppConstant.EMPTY_STRING
    
    @Published var yellowWins: Bool = false
    @Published var whiteWins: Bool = false
    @Published var purpleWins: Bool = false
    @Published var blueWins: Bool = false
    @Published var redWins: Bool = false
    @Published var greenWins: Bool = false
    
    // MARK: - METHOD/S
    
    private func calculateNumberWith(number: Int) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumFractionDigits = 1

        if number >= 1_000_000_000 {
            let num = Double(number) / 1_000_000_000
            return "\(numberFormatter.string(from: NSNumber(value: num)) ?? "")B"
        } else if number >= 1_000_000 {
            let num = Double(number) / 1_000_000
            return "\(numberFormatter.string(from: NSNumber(value: num)) ?? "")M"
        } else if number >= 1_000 {
            let num = Double(number) / 1_000
            return "\(numberFormatter.string(from: NSNumber(value: num)) ?? "")K"
        } else {
            return "\(number)"
        }
    }
    
    func getBalance() -> String {
        calculateNumberWith(number: balance)
    }
    
    func getYellowBet() -> String {
        calculateNumberWith(number: yellowBet)
    }
    
    func getWhiteBet() -> String {
        calculateNumberWith(number: whiteBet)
    }
    
    func getPurpleBet() -> String {
        calculateNumberWith(number: purpleBet)
    }
    
    func getBlueBet() -> String {
        calculateNumberWith(number: blueBet)
    }
    
    func getRedBet() -> String {
        calculateNumberWith(number: redBet)
    }
    
    func getGreenBet() -> String {
        calculateNumberWith(number: greenBet)
    }
    
    //: MARK: - PROCESS BET
    
    func betYellow() {
        if selectedBet != 0 && !(selectedBet > balance) && !(balance < 10)  {
            yellowBet += selectedBet
            balance -= selectedBet
        }
    }
    
    func betWhite() {
        if selectedBet != 0 && !(selectedBet > balance) && !(balance < 10)  {
            whiteBet += selectedBet
            balance -= selectedBet
        }
    }
    
    func betPurple() {
        if selectedBet != 0 && !(selectedBet > balance) && !(balance < 10)  {
            purpleBet += selectedBet
            balance -= selectedBet
        }
    }
    
    func betBlue() {
        if selectedBet != 0 && !(selectedBet > balance) && !(balance < 10)  {
            blueBet += selectedBet
            balance -= selectedBet
        }
    }
    
    func betRed() {
        if selectedBet != 0 && !(selectedBet > balance) && !(balance < 10)  {
            redBet += selectedBet
            balance -= selectedBet
        }
    }
    
    func betGreen() {
        if selectedBet != 0 && !(selectedBet > balance) && !(balance < 10)  {
            greenBet += selectedBet
            balance -= selectedBet
        }
    }
    
    //: MARK: - VALIDATE BET
    
    func validateBetWith(colorManager: ColorManager) {
        //: yellowBet
        if yellowBet != 0 {
            if colorManager.firstColor == .yellow && colorManager.secondColor == .yellow && colorManager.thirdColor == .yellow {
                
                balance += yellowBet * 4
                setYellowWinningBetWith(prize: yellowBet * 3)
                
            }  else if (colorManager.firstColor == .yellow && colorManager.secondColor == .yellow) ||
                        (colorManager.firstColor == .yellow && colorManager.thirdColor == .yellow) ||
                        (colorManager.secondColor == .yellow && colorManager.thirdColor == .yellow) {
                
                balance += yellowBet * 3
                setYellowWinningBetWith(prize: yellowBet * 2)
                
            } else if colorManager.firstColor == .yellow || colorManager.secondColor == .yellow || colorManager.thirdColor == .yellow {
                
                balance += yellowBet * 2
                setYellowWinningBetWith(prize: yellowBet * 1)
            }
        }
        
        //: whiteBet
        if whiteBet != 0 {
            if colorManager.firstColor == .white && colorManager.secondColor == .white && colorManager.thirdColor == .white {
                
                balance += whiteBet * 4
                setWhiteWinningBetWith(prize: whiteBet * 3)
                
            }  else if (colorManager.firstColor == .white && colorManager.secondColor == .white) ||
                        (colorManager.firstColor == .white && colorManager.thirdColor == .white) ||
                        (colorManager.secondColor == .white && colorManager.thirdColor == .white) {
                
                balance += whiteBet * 3
                setWhiteWinningBetWith(prize: whiteBet * 2)
                
            } else if colorManager.firstColor == .white || colorManager.secondColor == .white || colorManager.thirdColor == .white {
                
                balance += whiteBet * 2
                setWhiteWinningBetWith(prize: whiteBet * 1)
            }
        }
        
        //: purpleBet
        if purpleBet != 0 {
            if colorManager.firstColor == .purple && colorManager.secondColor == .purple && colorManager.thirdColor == .purple {
                
                balance += purpleBet * 4
                setPurpleWinningBetWith(prize: purpleBet * 3)
                
            } else if (colorManager.firstColor == .purple && colorManager.secondColor == .purple) ||
                        (colorManager.firstColor == .purple && colorManager.thirdColor == .purple) ||
                        (colorManager.secondColor == .purple && colorManager.thirdColor == .purple) {
                
                balance += purpleBet * 3
                setPurpleWinningBetWith(prize: purpleBet * 2)
                
            }  else if colorManager.firstColor == .purple || colorManager.secondColor == .purple || colorManager.thirdColor == .purple {
                
                balance += purpleBet * 2
                setPurpleWinningBetWith(prize: purpleBet * 1)
            }
        }
        
        //: blueBet
        if blueBet != 0 {
            if colorManager.firstColor == .blue && colorManager.secondColor == .blue && colorManager.thirdColor == .blue {
                
                balance += blueBet * 4
                setBlueWinningBetWith(prize: blueBet * 3)
                
            } else if (colorManager.firstColor == .blue && colorManager.secondColor == .blue) ||
                        (colorManager.firstColor == .blue && colorManager.thirdColor == .blue) ||
                        (colorManager.secondColor == .blue && colorManager.thirdColor == .blue) {
                
                balance += blueBet * 3
                setBlueWinningBetWith(prize: blueBet * 2)
                
            } else if colorManager.firstColor == .blue || colorManager.secondColor == .blue || colorManager.thirdColor == .blue {
                
                balance += blueBet * 2
                setBlueWinningBetWith(prize: blueBet * 1)
            }
        }
        
        //: redBet
        if redBet != 0 {
            if colorManager.firstColor == .red && colorManager.secondColor == .red && colorManager.thirdColor == .red {
                
                balance += redBet * 4
                setRedWinningBetWith(prize: redBet * 3)
                
            } else if (colorManager.firstColor == .red && colorManager.secondColor == .red) ||
                        (colorManager.firstColor == .red && colorManager.thirdColor == .red) ||
                        (colorManager.secondColor == .red && colorManager.thirdColor == .red) {
                
                balance += redBet * 3
                setRedWinningBetWith(prize: redBet * 2)
                
            } else if colorManager.firstColor == .red || colorManager.secondColor == .red || colorManager.thirdColor == .red {
                
                balance += redBet * 2
                setRedWinningBetWith(prize: redBet * 1)
            }
        }
        
        //: greenBet
        if greenBet != 0 {
            if colorManager.firstColor == .green && colorManager.secondColor == .green && colorManager.thirdColor == .green {
                
                balance += greenBet * 4
                setGreenWinningBetWith(prize:  greenBet * 3)
                
            } else if (colorManager.firstColor == .green && colorManager.secondColor == .green) ||
                        (colorManager.firstColor == .green && colorManager.thirdColor == .green) ||
                        (colorManager.secondColor == .green && colorManager.thirdColor == .green) {
                
                balance += greenBet * 3
                setGreenWinningBetWith(prize:  greenBet * 2)
                
            } else if colorManager.firstColor == .green || colorManager.secondColor == .green || colorManager.thirdColor == .green {
                
                balance += greenBet * 2
                setGreenWinningBetWith(prize:  greenBet * 1)
            }
        }
        
        //: clear bet
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.35) { [self] in
            clearBet()
        }
    }
    
    //: MARK: - SET WINNING BET
    
    private func setYellowWinningBetWith(prize: Int) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) { [self] in
            withAnimation(.easeIn) {
                yellowPrize = calculateNumberWith(number: prize)
                yellowWins = true
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) { [self] in
                withAnimation(.easeOut) {
                    yellowPrize = AppConstant.EMPTY_STRING
                    yellowWins = false
                }
            }
        }
    }
    
    private func setWhiteWinningBetWith(prize: Int) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) { [self] in
            withAnimation(.easeIn) {
                whitePrize = calculateNumberWith(number: prize)
                whiteWins = true
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) { [self] in
                withAnimation(.easeOut) {
                    whitePrize = AppConstant.EMPTY_STRING
                    whiteWins = false
                }
            }
        }
    }
    
    private func setPurpleWinningBetWith(prize: Int) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) { [self] in
            withAnimation(.easeIn) {
                purplePrize = calculateNumberWith(number: prize)
                purpleWins = true
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) { [self] in
                withAnimation(.easeOut) {
                    purplePrize = AppConstant.EMPTY_STRING
                    purpleWins = false
                }
            }
        }
    }
    
    private func setBlueWinningBetWith(prize: Int) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) { [self] in
            withAnimation(.easeIn) {
                bluePrize = calculateNumberWith(number: prize)
                blueWins = true
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) { [self] in
                withAnimation(.easeOut) {
                    bluePrize = AppConstant.EMPTY_STRING
                    blueWins = false
                }
            }
        }
    }
    
    private func setRedWinningBetWith(prize: Int) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) { [self] in
            withAnimation(.easeIn) {
                redPrize = calculateNumberWith(number: prize)
                redWins = true
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) { [self] in
                withAnimation(.easeOut) {
                    redPrize = AppConstant.EMPTY_STRING
                    redWins = false
                }
            }
        }
    }
    
    private func setGreenWinningBetWith(prize: Int) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) { [self] in
            withAnimation(.easeIn) {
                greenPrize = calculateNumberWith(number: prize)
                greenWins = true
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) { [self] in
                withAnimation(.easeOut) {
                    greenPrize = AppConstant.EMPTY_STRING
                    greenWins = false
                }
            }
        }
    }
    
    //: MARK: - CLEAR VALUES
    
    private func clearBet() {
        yellowBet = 0
        whiteBet = 0
        purpleBet = 0
        blueBet = 0
        redBet = 0
        greenBet = 0
    }
} //: BettingManager
