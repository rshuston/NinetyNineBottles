//
//  SongPlayer.swift
//  NinetyNineBottles
//
//  Created by Robert Huston on 8/5/21.
//

import Foundation
import AVFoundation

class SongPlayer: NSObject, AVSpeechSynthesizerDelegate {
    
    var synthesizer: AVSpeechSynthesizer?
    var speechVoice: AVSpeechSynthesisVoice?
    
    var src: (() -> Int) = { 99 }
    var dst: ((Int) -> Void) = { (_) in }
        
    struct Phrase {
        let text: String?
        let pitchMultipler: Float
        let countDown: Bool
    }
    
    var phraseTable: [Phrase] = [
        Phrase(text: nil,                               pitchMultipler: 1.0,    countDown: false),
        Phrase(text: " bottles of",                     pitchMultipler: 0.75,   countDown: false),
        Phrase(text: " beer on the wall.",              pitchMultipler: 1.0,    countDown: false),
        Phrase(text: nil,                               pitchMultipler: 1.1,    countDown: false),
        Phrase(text: " bottles of",                     pitchMultipler: 0.8,    countDown: false),
        Phrase(text: " beer.",                          pitchMultipler: 1.1,    countDown: false),
        Phrase(text: "take one down, pass it around,",  pitchMultipler: 0.95,   countDown: false),
        Phrase(text: nil,                               pitchMultipler: 0.7,    countDown: true),
        Phrase(text: " bottles",                        pitchMultipler: 0.85,   countDown: false),
        Phrase(text: " of",                             pitchMultipler: 0.95,   countDown: false),
        Phrase(text: " beer on the wall.",              pitchMultipler: 1.0,    countDown: false),
    ];
    
    var nextPhraseIndex = 0

    override init() {
        super.init()
        
        synthesizer = AVSpeechSynthesizer()
        synthesizer?.delegate = self
        
        speechVoice = getVoice(forName: "Trinoids")
    }
    
    private func getVoice(forName: String) -> AVSpeechSynthesisVoice? {
        var voice: AVSpeechSynthesisVoice?
        
        for v in AVSpeechSynthesisVoice.speechVoices() {
            if v.name == forName {
                voice = v
                break
            }
        }
        
        return voice
    }

    func Start(src: @escaping () -> Int, dst: @escaping (Int) -> Void) {
        self.src = src
        self.dst = dst
        
        let numberOfBottlesPhrase = NumberConverter.toPhrase(number: src())
        
        let phrase = phraseTable[0]
        let utterance = AVSpeechUtterance(string: numberOfBottlesPhrase)
        utterance.voice = speechVoice
        utterance.pitchMultiplier = phrase.pitchMultipler
        synthesizer?.speak(utterance)
        nextPhraseIndex = 1
    }

    func Stop() {
        synthesizer?.stopSpeaking(at: .immediate)
    }
    
    // MARK: AVSpeechSynthesizerDelegate
    
    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didFinish utterance: AVSpeechUtterance) {
        let phrase = phraseTable[nextPhraseIndex]

        var numberOfBottles = src()
        if phrase.countDown {
            numberOfBottles -= 1
            dst(numberOfBottles)
        }

        let numberOfBottlesPhrase = NumberConverter.toPhrase(number: numberOfBottles)

        let text: String
        if phrase.text != nil {
            text = phrase.text!
        } else {
            text = numberOfBottlesPhrase
        }
        let utterance = AVSpeechUtterance(string: text)
        utterance.voice = speechVoice
        utterance.pitchMultiplier = phrase.pitchMultipler
        synthesizer.speak(utterance)
        nextPhraseIndex += 1
        if nextPhraseIndex >= phraseTable.count {
            nextPhraseIndex = 0
        }
    }
    
}
