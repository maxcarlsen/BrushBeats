//
//  MusicTimer.swift
//  BrushBeats
//
//  Created by Max Carlsen on 2/19/21.
//

import Foundation
import AVFoundation

class TimerBundle : ObservableObject {
    @Published var seconds : Int = 120  // Seconds start at 120
    @Published var timer : Timer? = nil     // Timer initialized to nil
    @Published var music : AVAudioPlayer? = nil     // Music initialized to nil
    
    
    func startTimer() {
        // If music is nil then the music is restarting at 120 seconds and music is nil, so iniitialize music
        if self.music == nil {
            self.makeSong()
        }
        
        self.music?.play()  // Play the music
        
        // Create a timer that decreases the seconds and ends the timer & music at 0
        self.timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: {
            t in
            if self.seconds <= 0 {
                self.endTimer()
            }
            else {
                self.seconds -= 1
            }
        })
    }
    
    // Makes the song
    func makeSong() {
        if let path = Bundle.main.path(forResource: "90210", ofType: "mp3") {
            do {
                self.music = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            }
            catch {
                print("no audio")
            }
        }
    }
    
    // Pauses the music and kills the timer
    func pauseTimer() {
        self.music?.pause()
        self.timer?.invalidate()
        self.timer = nil
    }
    
    // Kills the music and timer
    func endTimer() {
        self.music?.stop()
        self.timer?.invalidate()
        self.music = nil
        self.timer = nil
    }
    
    // Kills the music and timer, and resets the seconds to 120
    func resetTimer() {
        self.endTimer()
        self.seconds = 120
    }
}
