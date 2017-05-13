//===----------------------------------------------------------------------===//
//
// PausableTimer.swift
//
// Copyright (c) 2016 Richard Piazza
// https://github.com/richardpiazza/CodeQuickKit
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.
//
//===----------------------------------------------------------------------===//

import Foundation

public typealias PausableTimerExpiredCompletion = () -> Void
public protocol PausableTimerDelegate {
    func pausableTimer(_ timer: PausableTimer, percentComplete: Double)
}

/// PausableTimer
/// Implements a timer that can be paused/resumed. Has options for 
/// delegate callbacks of status or a expiry completion handler.
public class PausableTimer {
    fileprivate let maxPercentComplete: Double = 1.0
    fileprivate var completedIntervals: TimeInterval = 0.0
    fileprivate var referenceDate: Date?
    
    public var timeInterval: TimeInterval
    public var delegate: PausableTimerDelegate?
    public var delegateRefreshRate: Float = 0.1
    public var expireCompletion: PausableTimerExpiredCompletion?
    
    /// Instantiates a new PausabelTimer and automatically 'resumes' the execution.
    public static func makeTimer(timeInterval: TimeInterval, delegate: PausableTimerDelegate? = nil, expireCompletion: PausableTimerExpiredCompletion? = nil) -> PausableTimer {
        let timer = PausableTimer(timeInterval: timeInterval, delegate: delegate, expireCompletion: expireCompletion)
        timer.resume()
        return timer
    }
    
    public static func makeTimer(timeInterval: TimeInterval, delegate: PausableTimerDelegate) -> PausableTimer {
        return makeTimer(timeInterval: timeInterval, delegate: delegate, expireCompletion: nil)
    }
    
    public static func makeTimer(timeInterval: TimeInterval, expireCompletion: @escaping PausableTimerExpiredCompletion) -> PausableTimer {
        return makeTimer(timeInterval: timeInterval, delegate: nil, expireCompletion: expireCompletion)
    }
    
    public init(timeInterval: TimeInterval, delegate: PausableTimerDelegate? = nil, expireCompletion: PausableTimerExpiredCompletion? = nil) {
        self.timeInterval = timeInterval
        self.delegate = delegate
        self.expireCompletion = expireCompletion
    }
    
    public convenience init(timeInterval: TimeInterval, delegate: PausableTimerDelegate) {
        self.init(timeInterval: timeInterval, delegate: delegate, expireCompletion: nil)
    }
    
    public convenience init(timeInterval: TimeInterval, expireCompletion: @escaping PausableTimerExpiredCompletion) {
        self.init(timeInterval: timeInterval, delegate: nil, expireCompletion: expireCompletion)
    }
    
    deinit {
        expireCompletion = nil
        delegate = nil
        referenceDate = nil
    }
    
    public var isActive: Bool {
        return referenceDate != nil
    }
    
    public var percentComplete: Double {
        let percent = completedIntervals / timeInterval
        return min(percent, maxPercentComplete)
    }
    
    fileprivate var dispatchTime: DispatchTime {
        return DispatchTime.now() + Double(Int64(delegateRefreshRate * Float(NSEC_PER_SEC))) / Double(NSEC_PER_SEC)
    }
    
    /// Resets the timer to the inital state and begins counting.
    public func reset() {
        completedIntervals = 0
        resume()
    }
    
    /// Pauses the timer
    public func pause() {
        referenceDate = nil
    }
    
    /// Resumes the timer
    public func resume() {
        referenceDate = Date(timeIntervalSinceNow: -completedIntervals)
        update()
    }
    
    /// Calculates the number of completed intervals and notifies the delegate.
    fileprivate func update() {
        guard let referenceDate = self.referenceDate else {
            return
        }
        
        completedIntervals = Date().timeIntervalSince(referenceDate)
        
        let percent = percentComplete
        
        guard percent < maxPercentComplete else {
            expire()
            return
        }
        
        if let delegate = self.delegate {
            delegate.pausableTimer(self, percentComplete: percent)
        }
        
        DispatchQueue.global(qos: .utility).asyncAfter(deadline: dispatchTime) {
            self.update()
        }
    }
    
    /// Terminates the execution of the timer and notifies delegates.
    fileprivate func expire() {
        referenceDate = nil
        if let delegate = self.delegate {
            delegate.pausableTimer(self, percentComplete: maxPercentComplete)
        }
        if let expireCompletion = self.expireCompletion {
            expireCompletion()
        }
    }
}
