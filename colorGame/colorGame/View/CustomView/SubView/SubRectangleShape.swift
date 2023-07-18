//
//  RectangleShape.swift
//  colorGame
//
//  Created by jebok on 7/6/23.
//

import SwiftUI
import SimpleToast

struct SubRectangleShape: View {
    // MARK: - PROPERTY
    
    @ObservedObject var bettingManager: BettingManager
    @State private var shouldShowToast: Bool = false
    

    let completion: (_ shouldShowToast: Bool) -> Void
    
    // MARK: - BODY
    
    var body: some View {
        VStack {
            HStack(spacing: 5.0) {
                BaseRectangleShape(shapeColor: .yellow)
                    .onTapGesture {
                        shouldShowToast = (bettingManager.balance < 10 ||
                                           bettingManager.selectedBet > bettingManager.balance)
                        
                        bettingManager.betYellow()
                        completion(shouldShowToast)
                    }
                    .overlay(
                        ZStack {
                            Text(bettingManager.yellowBet != 0 ? bettingManager.getYellowBet() : AppConstant.EMPTY_STRING)
                                .font(Font.system(size: 22.0).weight(.bold))
                                .foregroundColor(.black)

                            if bettingManager.yellowWins {
                                Text("+" + bettingManager.yellowPrize)
                                    .font(Font.system(size: 25.0).weight(.bold))
                                    .foregroundColor(.black)
                                    .lineLimit(1)
                                    .minimumScaleFactor(0.5)
                                    .padding(.init(top: 0.0, leading: 30.0, bottom: 50.0, trailing: 5.0))
                            }
                        }
                    )
                
                BaseRectangleShape(shapeColor: .white)
                    .onTapGesture {
                        shouldShowToast = (bettingManager.balance < 10 ||
                                           bettingManager.selectedBet > bettingManager.balance)
                        
                        bettingManager.betWhite()
                        completion(shouldShowToast)
                    }
                    .overlay(
                        ZStack {
                            Text(bettingManager.whiteBet != 0 ? bettingManager.getWhiteBet() : AppConstant.EMPTY_STRING)
                                .font(Font.system(size: 22.0).weight(.bold))
                                .foregroundColor(.black)
                            
                            if bettingManager.whiteWins {
                                Text("+" + bettingManager.whitePrize)
                                    .font(Font.system(size: 25.0).weight(.bold))
                                    .foregroundColor(.black)
                                    .lineLimit(1)
                                    .minimumScaleFactor(0.5)
                                    .padding(.init(top: 0.0, leading: 30.0, bottom: 50.0, trailing: 5.0))
                            }
                        }
                    )
                
                BaseRectangleShape(shapeColor: .purple)
                    .onTapGesture {
                        shouldShowToast = (bettingManager.balance < 10 ||
                                           bettingManager.selectedBet > bettingManager.balance)
                        
                        bettingManager.betPurple()
                        completion(shouldShowToast)
                    }
                    .overlay(
                        ZStack {
                            Text(bettingManager.purpleBet != 0 ? bettingManager.getPurpleBet() : AppConstant.EMPTY_STRING)
                                .font(Font.system(size: 22.0).weight(.bold))
                                .foregroundColor(.black)
                            
                            if bettingManager.purpleWins {
                                Text("+" + bettingManager.purplePrize)
                                    .font(Font.system(size: 25.0).weight(.bold))
                                    .foregroundColor(.black)
                                    .lineLimit(1)
                                    .minimumScaleFactor(0.5)
                                    .padding(.init(top: 0.0, leading: 30.0, bottom: 50.0, trailing: 5.0))
                            }
                        }
                    )
            } //: HStack
            
            HStack(spacing: 5.0) {
                BaseRectangleShape(shapeColor: .blue)
                    .onTapGesture {
                        shouldShowToast = (bettingManager.balance < 10 ||
                                           bettingManager.selectedBet > bettingManager.balance)
                        
                        bettingManager.betBlue()
                        completion(shouldShowToast)
                    }
                    .overlay(
                        ZStack {
                            Text(bettingManager.blueBet != 0 ? bettingManager.getBlueBet() : AppConstant.EMPTY_STRING)
                                .font(Font.system(size: 22.0).weight(.bold))
                                .foregroundColor(.black)
                            
                            if bettingManager.blueWins {
                                Text("+" + bettingManager.bluePrize)
                                    .font(Font.system(size: 25.0).weight(.bold))
                                    .foregroundColor(.black)
                                    .lineLimit(1)
                                    .minimumScaleFactor(0.5)
                                    .padding(.init(top: 0.0, leading: 30.0, bottom: 50.0, trailing: 5.0))
                            }
                        }
                    )
                
                BaseRectangleShape(shapeColor: .red)
                    .onTapGesture {
                        shouldShowToast = (bettingManager.balance < 10 ||
                                           bettingManager.selectedBet > bettingManager.balance)
                        
                        bettingManager.betRed()
                        completion(shouldShowToast)
                    }
                    .overlay(
                        ZStack {
                            Text(bettingManager.redBet != 0 ? bettingManager.getRedBet() : AppConstant.EMPTY_STRING)
                                .font(Font.system(size: 22.0).weight(.bold))
                                .foregroundColor(.black)
                            
                            if bettingManager.redWins {
                                Text("+" + bettingManager.redPrize)
                                    .font(Font.system(size: 25.0).weight(.bold))
                                    .foregroundColor(.black)
                                    .lineLimit(1)
                                    .minimumScaleFactor(0.5)
                                    .padding(.init(top: 0.0, leading: 30.0, bottom: 50.0, trailing: 5.0))
                            }
                        }
                    )
                
                BaseRectangleShape(shapeColor: .green)
                    .onTapGesture {
                        shouldShowToast = (bettingManager.balance < 10 ||
                                           bettingManager.selectedBet > bettingManager.balance)
                        
                        bettingManager.betGreen()
                        completion(shouldShowToast)
                    }
                    .overlay(
                        ZStack {
                            Text(bettingManager.greenBet != 0 ? bettingManager.getGreenBet() : AppConstant.EMPTY_STRING)
                                .font(Font.system(size: 22.0).weight(.bold))
                                .foregroundColor(.black)
                            
                            if bettingManager.greenWins {
                                Text("+" + bettingManager.greenPrize)
                                    .font(Font.system(size: 25.0).weight(.bold))
                                    .foregroundColor(.black)
                                    .lineLimit(1)
                                    .minimumScaleFactor(0.5)
                                    .padding(.init(top: 0.0, leading: 30.0, bottom: 50.0, trailing: 5.0))
                            }
                        }
                    )
            } //: HStack
        } //: VStack
    } //: body
} //: RectangleShape

// MARK: - PREVIEW

struct SubRectangleShape_Previews: PreviewProvider {
    static var previews: some View {
        SubRectangleShape(bettingManager: BettingManager(), completion: { shouldShowToast in })
            .previewDevice("iPhone 13 Pro Max")
    }
}


