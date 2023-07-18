//
//  ContentView.swift
//  Restart
//
//  Created by jebok on 5/11/23.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("onBoarding") var isOnBoardingViewActive: Bool = true
    
    var body: some View {
        ZStack {
            if isOnBoardingViewActive {
                OnBoardingView()
            } else {
                HomeView()
            }
        }//: ZStack
    }//: body
}//: ContentView

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 13 Pro Max")
    }
}
