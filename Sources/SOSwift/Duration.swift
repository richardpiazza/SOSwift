import Foundation

/// Quantity: Duration (use ISO 8601 duration format).
///
/// Inspired From: [Igor-Palaguta](https://github.com/Igor-Palaguta/YoutubeEngine/blob/master/Source/YoutubeEngine/Parser/NSDateComponents%2BISO8601.swift)
public struct Duration: RawRepresentable, Codable {
    public typealias RawValue = String
    
    public var rawValue: String
    
    public init?(rawValue: String) {
        self.rawValue = rawValue
    }
    
    public init(dateComponents: DateComponents) {
        var duration: String = "P"
        
        if let weeks = dateComponents.weekOfYear {
            duration.append("\(weeks)W")
            self.rawValue = duration
            return
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
        
        self.rawValue = duration
    }
    
    public var dateComponents: DateComponents {
        var components = DateComponents()
        
        let value = rawValue
        
        guard value.hasPrefix("P") else {
            return components
        }
        
        let durationString = String(value.dropFirst())
        var dateUnits: [(Calendar.Component, Int)]
        var timeUnits: [(Calendar.Component, Int)]?
        
        if let _ = durationString.range(of: "W") {
            let weekUnits = units(for: durationString, mappings: weekUnitMappings)
            for (component, value) in weekUnits {
                components.setValue(value, for: component)
            }
            
            return components
        }
        
        if let separatorRange = durationString.range(of: "T") {
            let date = String(durationString[..<separatorRange.lowerBound])
            let time = String(durationString[separatorRange.upperBound...])
            dateUnits = units(for: date, mappings: dateUnitMappings)
            timeUnits = units(for: time, mappings: timeUnitMappings)
        } else {
            dateUnits = units(for: durationString, mappings: dateUnitMappings)
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
}

fileprivate var dateUnitMappings: [Character : Calendar.Component] {
    return ["Y": .year, "M": .month, "D": .day]
}

fileprivate var weekUnitMappings: [Character : Calendar.Component] {
    return ["W" : .weekOfYear]
}

fileprivate var timeUnitMappings: [Character : Calendar.Component] {
    return ["H": .hour, "M": .minute, "S": .second]
}

fileprivate func units(for durationString: String, mappings: [Character : Calendar.Component]) -> [(Calendar.Component, Int)] {
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
