//
//  determineHigherValue.swift
//  Bilbary for iPhone
//
//  Created by SHOHJAHON on 10/07/24.
//
import SwiftUI
import Combine

class AppUsageTracker: ObservableObject {
    private var timer: Timer?
    private var startDate: Date?
    private var accumulatedTime: TimeInterval = 0
    
    @Published var totalTimeSpent: TimeInterval = 0
    
    func startSession() {
        startDate = Date()
        startTimer()
    }
    
    func endSession() {
        stopTimer()
        saveAccumulatedTime()
    }
    
    func resumeSession() {
        if let startDate = startDate {
            accumulatedTime += Date().timeIntervalSince(startDate)
        }
        startTimer()
    }
    
    func pauseSession() {
        if let startDate = startDate {
            accumulatedTime += Date().timeIntervalSince(startDate)
        }
        stopTimer()
    }
    
    private func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] _ in
            self?.updateTotalTime()
        }
    }
    
    private func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    private func updateTotalTime() {
        if let startDate = startDate {
            totalTimeSpent = accumulatedTime + Date().timeIntervalSince(startDate)
        }
    }
    
    private func saveAccumulatedTime() {
        let userDefaults = UserDefaults.standard
        userDefaults.set(totalTimeSpent, forKey: "totalTimeSpent")
    }
    
    func loadTotalTimeSpent() {
        let userDefaults = UserDefaults.standard
        totalTimeSpent = userDefaults.double(forKey: "totalTimeSpent")
    }
}
