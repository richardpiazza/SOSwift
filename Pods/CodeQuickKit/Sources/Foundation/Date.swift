//===----------------------------------------------------------------------===//
//
// Date.swift
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

public extension Date {
    /// Provides the current datetime minus 24 hours.
    public static var yesturday: Date {
        return Date().dateByAdding(days: -1)!
    }
    
    /// Provides the current datetime minus 48 hours.
    public static var twoDaysAgo: Date {
        return Date().dateByAdding(days: -2)!
    }
    
    /// Provides the current datetime minus 7 days.
    public static var lastWeek: Date {
        return Date().dateByAdding(days: -7)!
    }
    
    /// Provides the current datetime plus 24 hours.
    public static var tomorrow: Date {
        return Date().dateByAdding(days: 1)!
    }
    
    /// Provides the current datetime plus 48 days.
    public static var dayAfterTomorrow: Date {
        return Date().dateByAdding(days: 2)!
    }
    
    /// Provides the current datetime plus 7 days.
    public static var nextWeek: Date {
        return Date().dateByAdding(days: 7)!
    }
    
    /// Determines if the instance date is before the reference date (second granularity).
    public func isBefore(_ date: Date) -> Bool {
        return Calendar.current.compare(self, to: date, toGranularity: .second) == .orderedAscending
    }
    
    /// Determines if the instance date is after the reference date (second granularity).
    public func isAfter(_ date: Date) -> Bool {
        return Calendar.current.compare(self, to: date, toGranularity: .second) == .orderedDescending
    }
    
    /// Determines if the instance date is equal to the reference date (second granularity).
    public func isSame(_ date: Date) -> Bool {
        return Calendar.current.compare(self, to: date, toGranularity: .second) == .orderedSame
    }
    
    /// Uses `Calendar` to return the instance date mutated by the specified number of minutes.
    public func dateByAdding(minutes value: Int) -> Date? {
        return Calendar.current.date(byAdding: .minute, value: value, to: self)
    }
    
    /// Uses `Calendar` to return the instance date mutated by the specified number of hours.
    public func dateByAdding(hours value: Int) -> Date? {
        return Calendar.current.date(byAdding: .hour, value: value, to: self)
    }
    
    /// Uses `Calendar` to return the instance date mutated by the specified number of days.
    public func dateByAdding(days value: Int) -> Date? {
        return Calendar.current.date(byAdding: .day, value: value, to: self)
    }
}
