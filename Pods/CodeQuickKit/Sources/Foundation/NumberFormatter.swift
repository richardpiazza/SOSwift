//===----------------------------------------------------------------------===//
//
// NumberFormatter.swift
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

public enum NumberFormat {
    case integer
    case singleDecimal
    case decimal
    case currency
    case percent
    
    public var numberStyle: NumberFormatter.Style {
        switch self {
        case .currency: return .currency
        case .percent: return .percent
        default: return .decimal
        }
    }
    
    public var minimumFractionDigits: Int {
        switch self {
        case .percent: return 1
        default: return 0
        }
    }
    
    public var maximumFractionDigits: Int {
        switch self {
        case .integer: return 0
        case .singleDecimal: return 1
        case .decimal, .currency: return 2
        case .percent: return 4
        }
    }
    
    public var locale: Locale {
        switch self {
        default: return Locale.current
        }
    }
}

public extension NumberFormatter {
    fileprivate struct common {
        static let integerFormatter = NumberFormatter(.integer)
        static let singleDecimalFormatter = NumberFormatter(.singleDecimal)
        static let decimalFormatter = NumberFormatter(.decimal)
        static let currencyFormatter = NumberFormatter(.currency)
        static let percentFormatter = NumberFormatter(.percent)
    }
    
    public convenience init(_ format: NumberFormat) {
        self.init()
        numberStyle = format.numberStyle
        locale = format.locale
        minimumFractionDigits = format.minimumFractionDigits
        maximumFractionDigits = format.maximumFractionDigits
    }
    
    /// An NSNumberFormatter for whole integers.
    /// Uses the NSNumberFormatterDecimalStyle with MaximumFractionDigits set to
    /// 0 (zero).
    public static func integerFormatter() -> NumberFormatter {
        return common.integerFormatter
    }
    
    public static func integer(fromString string: String) -> Int? {
        return common.integerFormatter.number(from: string)?.intValue
    }
    
    public static func string(fromInteger number: Int) -> String? {
        return common.integerFormatter.string(from: NSNumber(value: number))
    }
    
    /// An NSNumberFormatter for whole integers.
    /// Uses the NSNumberFormatterDecimalStyle with MaximumFractionDigits set to
    /// 1 (one).
    public static func singleDecimalFormatter() -> NumberFormatter {
        return common.singleDecimalFormatter
    }
    
    public static func singleDecimal(fromString string: String) -> Float? {
        return common.singleDecimalFormatter.number(from: string)?.floatValue
    }
    
    public static func string(fromSingleDecimal number: Float) -> String? {
        return common.singleDecimalFormatter.string(from: NSNumber(value: number))
    }
    
    /// An NSNumberFormatter for whole integers.
    /// Uses the NSNumberFormatterDecimalStyle with MaximumFractionDigits set to
    /// 2 (two).
    public static func decimalFormatter() -> NumberFormatter {
        return common.decimalFormatter
    }
    
    public static func decimal(fromString string: String) -> Float? {
        return common.decimalFormatter.number(from: string)?.floatValue
    }
    
    public static func string(fromDecimal number: Float) -> String? {
        return common.decimalFormatter.string(from: NSNumber(value: number))
    }
    
    /// An NSNumberFormatter for whole integers.
    /// Uses the NSNumberFormatterCurrencyStyle.
    public static func currencyFormatter() -> NumberFormatter {
        return common.currencyFormatter
    }
    
    public static func currency(fromString string: String) -> Float? {
        return common.currencyFormatter.number(from: string)?.floatValue
    }
    
    public static func string(fromCurrency number: Float) -> String? {
        return common.currencyFormatter.string(from: NSNumber(value: number))
    }
    
    /// An NSNumberFormatter for whole integers.
    /// Uses the NSNumberFormatterPercentStyle with MinimumFractionDigits set to
    /// 1 (one) and MaximumFractionDigits set to 3 (three).
    public static func percentFormatter() -> NumberFormatter {
        return common.percentFormatter
    }
    
    public static func percent(fromString string: String) -> Float? {
        return common.percentFormatter.number(from: string)?.floatValue
    }
    
    public static func string(fromPercent number: Float) -> String? {
        return common.percentFormatter.string(from: NSNumber(value: number))
    }
}
