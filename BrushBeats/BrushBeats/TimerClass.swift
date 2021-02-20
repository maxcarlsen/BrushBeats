//
//  TimerClass.swift
//  BrushBeats
//
//  Created by Max Carlsen on 2/17/21.
//

import Foundation

class TimerBundle : ObservableObject {
    @Published var seconds : Int = 120
    @Published var timer : Timer? = nil
    
    func startTimer() {
        self.timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: {
            t in
            if self.seconds <= 0 {
                self.pauseTimer()
            }
            else {
                self.seconds -= 1
            }
        })
    }
    
    func pauseTimer() {
        self.timer?.invalidate()
        self.timer = nil
    }
    
    func resetTimer() {
        self.pauseTimer()
        self.seconds = 120
    }
}
