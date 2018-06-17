//
//  Synthesizer.swift
//  Magic 8 Ball
//
//  Created by verebes on 29/03/2018.
//  Copyright © 2018 A&D Progress. All rights reserved.
//

import Foundation
import AVFoundation

class SpeechSynthesizer: AVSpeechSynthesizer {
    
    let synth = AVSpeechSynthesizer()
    func speak(whatToSpeak: String) {
        let myUtterance = AVSpeechUtterance(string: whatToSpeak)
        //myUtterance = AVSpeechUtterance(string: whatToSpeak)
        myUtterance.rate = 0.5
        myUtterance.voice = AVSpeechSynthesisVoice(language: "en-US")
        synth.speak(myUtterance)
    }
}

//let say = SpeechSynthesizer()
