//
//  EagleSound.swift
//  CalculatorYearlyPay
//
//  Created by ALIA M NEELY on 6/29/17.
//  Copyright © 2017 Wylan. All rights reserved.
//

import Foundation
import AVFoundation

struct EagleSoundController {

    let eagleSoundPath = Bundle.main.path(forResource: "Hawk-sound", ofType: "mp3")
    var soundPlayer:AVAudioPlayer = AVAudioPlayer()
    
    mutating func playEagleSound() {
        guard let soundPath = eagleSoundPath else {print("errir finding sound path");return}
        do {
            try soundPlayer = AVAudioPlayer(contentsOf: NSURL(fileURLWithPath: soundPath) as URL, fileTypeHint: "mp3")
            soundPlayer.play()
        } catch {}
    }
}
