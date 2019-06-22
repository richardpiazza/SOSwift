import Foundation

/// Quantity: Duration (use ISO 8601 duration format).
public struct Duration: RawRepresentable, Codable {
    public typealias RawValue = String
    
    public var rawValue: String
    
    public init?(rawValue: String) {
        self.rawValue = rawValue
    }
    
    public init(dateComponents: DateComponents) {
        if #available(macOS 10.12, iOS 10.0, tvOS 10.0, watchOS 3.0, *) {
            self = DurationFormatter.duration(from: dateComponents)
        } else {
            self.init(rawValue: "")!
        }
    }
    
}

// Inspired From: https://github.com/Igor-Palaguta/YoutubeEngine/blob/master/Source/YoutubeEngine/Parser/NSDateComponents%2BISO8601.swift
@available(macOS 10.12, iOS 10.0, tvOS 10.0, watchOS 3.0, *)
fileprivate struct DurationFormatter {
    var duration: Duration
    
    init(_ duration: Duration) {
        self.duration = duration
    }
    
    private static let dateUnitMappings: [Character : Calendar.Component] = ["Y": .year, "M": .month, "D": .day]
    private static let weekUnitMappings: [Character : Calendar.Component] = ["W" : .weekOfYear]
    private static let timeUnitMappings: [Character : Calendar.Component] = ["H": .hour, "M": .minute, "S": .second]
    
    static func duration(from dateComponents: DateComponents) -> Duration {
        var duration: String = "P"
        if let weeks = dateComponents.weekOfYear {
            duration.append("\(weeks)W")
            return Duration(rawValue: duration)!
        }
        
        if let value = dateComponents.year {
            duration.append("\(value)Y")
        }
        if let value = dateComponents.month {
            duration.append("\(value)M")
        }
        if let value = dateComponents.day {
            duration.append("\(value)D")
        }
        duration.append("T")
        if let value = dateComponents.hour {
            duration.append("\(value)H")
        }
        if let value = dateComponents.minute {
            duration.append("\(value)M")
        }
        if let value = dateComponents.second {
            duration.append("\(value)S")
        }
        
        return Duration(rawValue: duration)!
    }
    
    static func dateComponents(from duration: Duration) -> DateComponents {
        var components = DateComponents()
        
        let value = duration.rawValue
        
        guard value.hasPrefix("P") else {
            return components
        }
        
        let durationString = String(value.dropFirst())
        var dateUnits: [(Calendar.Component, Int)]
        var timeUnits: [(Calendar.Component, Int)]?
        
        if let _ = durationString.range(of: "W") {
            let weekUnits = self.units(for: durationString, mappings: weekUnitMappings)
            for (component, value) in weekUnits {
                components.setValue(value, for: component)
            }
            
            return components
        }
        
        if let separatorRange = durationString.range(of: "T") {
            let date = String(durationString[..<separatorRange.lowerBound])
            let time = String(durationString[separatorRange.upperBound...])
            dateUnits = self.units(for: date, mappings: dateUnitMappings)
            timeUnits = self.units(for: time, mappings: timeUnitMappings)
        } else {
            dateUnits = self.units(for: durationString, mappings: dateUnitMappings)
        }
        
        for (component, value) in dateUnits {
            components.setValue(value, for: component)
        }
        
        if let times = timeUnits {
            for (component, value) in times {
                components.setValue(value, for: component)
            }
        }
        
        return components
    }
    
    static func units(for durationString: String, mappings: [Character : Calendar.Component]) -> [(Calendar.Component, Int)] {
        guard !durationString.isEmpty else {
            return []
        }
        
        guard mappings.count > 0 else {
            return []
        }
        
        var components: [(Calendar.Component, Int)] = []
        
        let identifiersSet = CharacterSet(charactersIn: String(mappings.keys))
        
        let scanner = Scanner(string: durationString)
        while !scanner.isAtEnd {
            var value: Int = 0
            if !scanner.scanInt(&value) {
                return components
            }
            
            #if os(Linux)
            var identifier: String?
            if !scanner.scanUpToCharacters(from: identifiersSet, into: &identifier) || identifier?.count != 1 {
                return components
            }
            
            let unit = mappings[Character(identifier!)]!
            
            components.append((unit, value))
            #else
            var identifier: NSString?
            if !scanner.scanCharacters(from: identifiersSet, into: &identifier) || identifier?.length != 1 {
                return components
            }
            
            let unit = mappings[Character(identifier! as String)]!
            
            components.append((unit, value))
            #endif
        }
        
        return components
    }
}
