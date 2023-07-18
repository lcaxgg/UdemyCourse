//
//  ContentView.swift
//  colorGame
//
//  Created by jebok on 7/6/23.
//

import SwiftUI
import SimpleToast

struct ContentView: View {
    // MARK: - PROPERTY
    
    @ObservedObject private var gameManager = GameManager()
    @State private var refreshID: UUID = UUID()
    @State private var showToast: Bool = false
    
    private let toastOptions = SimpleToastOptions(
        alignment: .top,
        hideAfter: 1.5,
        animation: .easeInOut,
        modifierType: .fade
    )
    
    // MARK: - BODY
    
    var body: some View {
        ZStack {
            // MARK: - BACKGROUND
            
            LinearGradient(gradient: Gradient(colors: [.brown.opacity(0.7), .brown]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            
            // MARK: - HEADER

            VStack {
                HStack(spacing: 30.0) {
                    Image("casinoToken")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 10, height: 40)
                        .padding(.leading, 50.0)
                    
                    Text("\(gameManager.bettingManager.getBalance())")
                        .font(.system(.title, design: .rounded))
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                    
                    Spacer()
                }
                .padding(.top, 50.0)
                .padding(.bottom, 40.0)
                
                // MARK: - BODY
                
                MainRectangleShape(gameManager: gameManager)
                    .padding(.bottom, 20.0)
                
                ZStack {
                    Capsule()
                        .fill(Color(uiColor: .brown))
                        .frame(width: 170.0, height: 70.0)
                        .gesture(
                            TapGesture().onEnded({ _ in
                                gameManager.processRoll()
                            })
                        )
                        .scaleEffect(gameManager.isRollButtonTapped ? 0.95 : 1.0)
                    
                    HStack {
                        Text(gameManager.text)
                            .font(.system(.title3, design: .rounded))
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                    }
                } //: ZStack
                
                Spacer()
                
                SubRectangleShape(bettingManager: gameManager.bettingManager, completion: { shouldShowToast in
                    playSound(sound: "bet", type: "mp3")
                    
                    showToast = shouldShowToast
                    refreshID = UUID()
                })
                .padding(.bottom, 20.0)
                
                // MARK: - FOOTER
                
                MainTokenShape(gameManager: gameManager)
                    .padding(.bottom, -17.0)
                    .overlay(
                        ZStack {
                            if gameManager.isSubTokenVisible {
                                SubTokenShape(gameManager: gameManager)
                                    .padding(.bottom, 260.0)
                            }
                        }
                    )
            } //: VStack
        } //: ZStack
        .simpleToast(isPresented: $showToast, options: toastOptions, content: {
            HStack {
                Image(systemName: "exclamationmark.circle")
                    .aspectRatio(contentMode: .fill)
                    .foregroundColor(Color.white)
                
                Text("Insufficient Token")
                    .font(.system(.title3, design: .rounded))
                    .fontWeight(.medium)
                    .foregroundColor(.white)
            }
            .padding(20)
            .background(Color.black.opacity(0.4))
            .cornerRadius(30.0)
        })
        .id(refreshID)
        .disabled(gameManager.timerManager.isTimerRunning)
        .onReceive(gameManager.timerManager.timer ?? Timer.TimerPublisher(interval: 0, runLoop: .main, mode: .default)) { _ in
            gameManager.processTimer()
        }
    } //: body
} //: ContentView

// MARK: - PREVIEW

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 13 Pro Max")
    }
}
