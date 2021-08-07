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
    
    var src: () -> Int = { 99 }
    var dst: (Int) -> Void = { (_) in }
    var completion: () -> Void = { }
        
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
        Phrase(text: nil,                               pitchMultipler: 0.75,    countDown: true),
        Phrase(text: " bottles",                        pitchMultipler: 0.85,   countDown: false),
        Phrase(text: " of",                             pitchMultipler: 0.95,   countDown: false),
        Phrase(text: " beer on the wall.",              pitchMultipler: 1.0,    countDown: false),
    ];
    
    var nextPhraseIndex = 0
    var lastPhraseSpoken = false

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

    func Start(src: @escaping () -> Int, dst: @escaping (Int) -> Void, completion: @escaping () -> Void) {
        self.src = src
        self.dst = dst
        self.completion = completion
        
        let numberOfBottles = src()
        var numberOfBottlesPhrase = NumberConverter.toPhrase(number: src())
        if numberOfBottles == 1 {
            numberOfBottlesPhrase = numberOfBottlesPhrase.replacingOccurrences(of: "bottles", with: "bottle")
        }
        
        lastPhraseSpoken = false
        
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
        if lastPhraseSpoken {
            completion()
            return
        }
        
        let phrase = phraseTable[nextPhraseIndex]

        var numberOfBottles = src()
        if phrase.countDown && numberOfBottles > 0  {
            numberOfBottles -= 1
            dst(numberOfBottles)
        }

        var text: String
        if phrase.text != nil {
            text = phrase.text!
            if numberOfBottles == 1 {
                text = text.replacingOccurrences(of: "bottles", with: "bottle")
            }
        } else {
            if numberOfBottles > 0 {
                text = NumberConverter.toPhrase(number: numberOfBottles)
            } else {
                text = "no more"
            }
        }
        let utterance = AVSpeechUtterance(string: text)
        utterance.voice = speechVoice
        utterance.pitchMultiplier = phrase.pitchMultipler
        synthesizer.speak(utterance)

        nextPhraseIndex += 1
        if nextPhraseIndex >= phraseTable.count {
            nextPhraseIndex = 0
        }
        if numberOfBottles == 0 && nextPhraseIndex == 0 {
            lastPhraseSpoken = true
        }
    }
    
}
