//
//  SoundManager.swift
//  colorGame
//
//  Created by OPSolutions on 7/18/23.
//

import AVFoundation

// MARK: - PROPERTY

var audioPlayer: AVAudioPlayer?

// MARK: - METHOD/S

func playSound(sound: String, type: String) {
    if let path = Bundle.main.path(forResource: sound, ofType: type) {
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            audioPlayer?.play()
        } catch {
            print("ERROR: Could not find and play the sound file!")
        }
    }
}



