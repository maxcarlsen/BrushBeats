//
//  ContentView.swift
//  BrushBeats
//
//  Created by Max Carlsen on 2/16/21.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var timeBundle = TimerBundle()
    
    var body: some View {
        ZStack {
            // Background
            Color(red : (40 / 255.0), green : (30 / 255.0), blue : (90 / 255.0))
                .ignoresSafeArea()
            
            VStack {
                // Timer Title
                Text("Timer Boi")
                    .font(.headline)
                    .foregroundColor(Color.white)
                    .padding()
                
                // Time shows extra 0 if less than 10 seconds
                if (timeBundle.seconds % 60) < 10 {
                    Text(String(format: "%d:0" + "%d", timeBundle.seconds / 60, timeBundle.seconds % 60))
                        .foregroundColor(Color.white)
                        .padding()
                }
                // Time shows regular time if seconds greater than 10 seconds
                else {
                    Text(String(format: "%d:%d", timeBundle.seconds / 60, timeBundle.seconds % 60))
                        .foregroundColor(Color.white)
                        .padding()
                }
                
                HStack {
                    // Start button
                    Button(action: {timeBundle.startTimer()}, label: {
                        Text("Start")
                            .foregroundColor(Color.green)
                    })
                    .padding()
                    
                    // Stop button
                    Button(action: {timeBundle.pauseTimer()}, label: {
                        Text("Pause")
                            .foregroundColor(Color.red)
                    })
                    .padding()
                    
                    // Reset Button
                    Button(action: {timeBundle.resetTimer()}, label: {
                        Text("Reset")
                            .foregroundColor(Color.yellow)
                    })
                    .padding()
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

