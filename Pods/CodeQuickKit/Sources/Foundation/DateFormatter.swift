//===----------------------------------------------------------------------===//
//
// DateFormatter.swift
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

/// ## DateFormat
///
/// Enum grouping the format options for `NSDateFormatter`s.
public enum DateFormat {
    case rfc1123
    case shortDateTime
    case shortDateOnly
    case shortTimeOnly
    case mediumDateTime
    case mediumDateOnly
    case mediumTimeOnly
    case longDateTime
    case longDateOnly
    case longTimeOnly
    case fullDateTime
    case fullDateOnly
    case fullTimeOnly
    
    public var dateFormat: String? {
        switch self {
        case .rfc1123: return "EEE',' dd MMM yyyy HH':'mm':'ss 'GMT'"
        default: return nil
        }
    }
    
    public var dateStyle: DateFormatter.Style? {
        switch self {
        case .shortDateTime, .shortDateOnly: return .short
        case .mediumDateTime, .mediumDateOnly: return .medium
        case .longDateTime, .longDateOnly: return .long
        case .fullDateTime, .fullDateOnly: return .full
        case .shortTimeOnly, .mediumTimeOnly, .longTimeOnly, .fullTimeOnly: return .none
        default: return nil
        }
    }
    
    public var timeStyle: DateFormatter.Style? {
        switch self {
        case .shortDateTime, .shortTimeOnly: return .short
        case .mediumDateTime, .mediumTimeOnly: return .medium
        case .longDateTime, .longTimeOnly: return .long
        case .fullDateTime, .fullTimeOnly: return .full
        case .shortDateOnly, .mediumDateOnly, .longDateOnly, .fullDateOnly: return .none
        default: return nil
        }
    }
    
    public var locale: Locale {
        switch self {
        case .rfc1123: return Locale(identifier: "en_US_POSIX")
        default: return Locale.current
        }
    }
    
    public var timeZone: TimeZone {
        switch self {
        case .rfc1123: return TimeZone(abbreviation: "GMT")!
        default: return TimeZone.current
        }
    }
}

/// Extension of `NSDateFormatter` adding static access to common formatters.
public extension DateFormatter {
    fileprivate struct common {
        static let rfc1123DateFormatter: DateFormatter = DateFormatter(.rfc1123)
        static let shortDateTimeFormatter: DateFormatter = DateFormatter(.shortDateTime)
        static let shortDateOnlyFormatter: DateFormatter = DateFormatter(.shortDateOnly)
        static let shortTimeOnlyFormatter: DateFormatter = DateFormatter(.shortTimeOnly)
        static let mediumDateTimeFormatter: DateFormatter = DateFormatter(.mediumDateTime)
        static let mediumDateOnlyFormatter: DateFormatter = DateFormatter(.mediumDateOnly)
        static let mediumTimeOnlyFormatter: DateFormatter = DateFormatter(.mediumTimeOnly)
        static let longDateTimeFormatter: DateFormatter = DateFormatter(.longDateTime)
        static let longDateOnlyFormatter: DateFormatter = DateFormatter(.longDateOnly)
        static let longTimeOnlyFormatter: DateFormatter = DateFormatter(.longTimeOnly)
        static let fullDateTimeFormatter: DateFormatter = DateFormatter(.fullDateTime)
        static let fullDateOnlyFormatter: DateFormatter = DateFormatter(.fullDateOnly)
        static let fullTimeOnlyFormatter: DateFormatter = DateFormatter(.fullTimeOnly)
    }
    
    public convenience init(_ format: DateFormat) {
        self.init()
        if let dateFormat = format.dateFormat {
            self.dateFormat = dateFormat
        }
        if let dateStyle = format.dateStyle {
            self.dateStyle = dateStyle
        }
        if let timeStyle = format.timeStyle {
            self.timeStyle = timeStyle
        }
        locale = format.locale
        timeZone = format.timeZone
    }
    
    /// DateFormatter with the format "EEE',' dd MMM yyyy HH':'mm':'ss 'GMT'"
    ///
    /// ***Example:*** "Fri, 05 Nov 1982 08:00:00 GMT"
    public static var rfc1123DateFormatter: DateFormatter {
        return common.rfc1123DateFormatter
    }
    
    public static func rfc1123Date(fromString string: String) -> Date? {
        return common.rfc1123DateFormatter.date(from: string)
    }
    
    public static func rfc1123String(fromDate date: Date) -> String {
        return common.rfc1123DateFormatter.string(from: date)
    }
    
    /// Date Formatter using the .ShortStyle for both Date and Time
    /// ***Example:*** "11/5/82, 8:00 AM"
    public static var shortDateTimeFormatter: DateFormatter {
        return common.shortDateTimeFormatter
    }
    
    /// Date Formatter using the .ShortStyle for Date and .NoStyle for Time
    /// ***Example:*** "11/5/82"
    public static var shortDateOnlyFormatter: DateFormatter {
        return common.shortDateOnlyFormatter
    }
    
    /// Date Formatter using the .NoStyle for Date and .ShortStyle for Time
    /// ***Example:*** "8:00 AM"
    public static var shortTimeOnlyFormatter: DateFormatter {
        return common.shortTimeOnlyFormatter
    }
    
    /// Date Formatter using the .MediumStyle for both Date and Time
    /// ***Example:*** "Nov 5, 1982, 8:00:00 AM"
    public static var mediumDateTimeFormatter: DateFormatter {
        return common.mediumDateTimeFormatter
    }
    
    /// Date Formatter using the .MediumStyle for Date and .NoStyle for Time
    /// ***Example:*** "Nov 5, 1982"
    public static var mediumDateOnlyFormatter: DateFormatter {
        return common.mediumDateOnlyFormatter
    }
    
    /// Date Formatter using the .NoStyle for Date and .MediumStyle for Time
    /// ***Example:*** "8:00:00 AM"
    public static var mediumTimeOnlyFormatter: DateFormatter {
        return common.mediumTimeOnlyFormatter
    }
    
    /// Date Formatter using the .LongStyle for both Date and Time
    /// ***Example:*** "November 5, 1982 at 8:00:00 AM GMT"
    public static var longDateTimeFormatter: DateFormatter {
        return common.longDateTimeFormatter
    }
    
    /// Date Formatter using the .LongStyle for Date and .NoStyle for Time
    /// ***Example:*** "November 5, 1982"
    public static var longDateOnlyFormatter: DateFormatter {
        return common.longDateOnlyFormatter
    }
    
    /// Date Formatter using the .NoStyle for Date and .LongStyle for Time
    /// ***Example:*** "8:00:00 AM GMT"
    public static var longTimeOnlyFormatter: DateFormatter {
        return common.longTimeOnlyFormatter
    }
    
    /// Date Formatter using the .FullStyle for both Date and Time
    /// ***Example:*** "Friday, November 5, 1982 at 8:00:00 AM GMT"
    public static var fullDateTimeFormatter: DateFormatter {
        return common.fullDateTimeFormatter
    }
    
    /// Date Formatter using the .LongStyle for Date and .NoStyle for Time
    /// ***Example:*** "Friday, November 5, 1982"
    public static var fullDateOnlyFormatter: DateFormatter {
        return common.fullDateOnlyFormatter
    }
    
    /// Date Formatter using the .NoStyle for Date and .LongStyle for Time
    /// ***Example:*** "8:00:00 AM GMT"
    public static var fullTimeOnlyFormatter: DateFormatter {
        return common.fullTimeOnlyFormatter
    }
}
