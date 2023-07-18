//
//  BaseTokenShape.swift
//  colorGame
//
//  Created by jebok on 7/14/23.
//

import Foundation
import SwiftUI

struct BaseTokenShape: View {
    // MARK: - PROPERTY
    
    var tokenName: String = "blackToken"
    var tokenText: String = "100"
    var tokenWidth: CGFloat = 130.0
    var tokenHeight: CGFloat = 130.0
    
    // MARK: - BODY
    
    var body: some View {
        ZStack {
            Image(tokenName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .clipShape(Circle())
                .frame(width: tokenWidth, height: tokenHeight)
                .overlay(
                    Text(tokenText)
                        .font(Font.system(size: 13.0).weight(.bold))
                        .foregroundColor(.white)
                        .padding(.bottom, 3.0)
                )
        } //: ZStack
    } //: body
} //: BaseTokenShape

// MARK: - PREVIEW

struct BaseTokenShape_Previews: PreviewProvider {
    static var previews: some View {
        BaseTokenShape()
            .previewDevice("iPhone 13 Pro Max")
    }
}
