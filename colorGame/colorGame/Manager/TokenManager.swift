//
//  TokenManager.swift
//  colorGame
//
//  Created by jebok on 7/14/23.
//

import Foundation
import CoreGraphics

class TokenManager: ObservableObject {
    // MARK: - PROPERTY
    
    @Published var tokenName: String = "blackToken"
    @Published var tokenText: String = "100"
}
