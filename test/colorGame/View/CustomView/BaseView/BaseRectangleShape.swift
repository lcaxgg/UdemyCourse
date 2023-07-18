//
//  BaseRectangleShape.swift
//  colorGame
//
//  Created by jebok on 7/14/23.
//

import SwiftUI

struct BaseRectangleShape: View {
    // MARK: - PROPERTY

    var shapeColor: Color = .green
    
    // MARK: - BODY
    
    var body: some View {
        ZStack {
            Rectangle()
                .frame(width: 120.0, height: 120.0)
                .foregroundColor(Color.clear)
                .background(
                    LinearGradient(
                        gradient: Gradient(colors: [shapeColor.opacity(0.5), shapeColor]),
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
                .border(Color.black, width: 5.0)
                .cornerRadius(10.0)
        } //: ZStack
    } //: body
} //: BaseRectangleShape

// MARK: - PREVIEW

struct BaseRectangleShape_Previews: PreviewProvider {
    static var previews: some View {
        BaseRectangleShape()
            .previewDevice("iPhone 13 Pro Max")
    }
}
