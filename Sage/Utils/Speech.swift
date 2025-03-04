//
//  Speech.swift
//  Sage
//
//  Created by Gabriel Celis on 3/4/25.
//

import AVFoundation
import SwiftUI

class SpeechSynthesizer: ObservableObject {
    private var synthesizer = AVSpeechSynthesizer()

    func speak(_ text: String) {
        let utterance = AVSpeechUtterance(string: text)
        utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
        utterance.rate = 0.5  // Adjust speaking speed
        synthesizer.speak(utterance)
    }
}
