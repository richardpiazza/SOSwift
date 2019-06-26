import Foundation

/// Quantity: Duration (use ISO 8601 duration format).
///
/// Inspired From: [Igor-Palaguta](https://github.com/Igor-Palaguta/YoutubeEngine/blob/master/Source/YoutubeEngine/Parser/NSDateComponents%2BISO8601.swift)
public struct Duration: Codable {
    
    private var _dateComponents: DateComponents
    
    public init(dateComponents: DateComponents) {
        _dateComponents = dateComponents
    }
    
    public init(stringValue: String) {
        _dateComponents = components(for: stringValue)
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let value = try container.decode(String.self)
        _dateComponents = components(for: value)
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(stringValue)
    }
    
    public var stringValue: String {
        return durationString(from: _dateComponents)
    }
    
    public var dateComponents: DateComponents {
        return _dateComponents
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

fileprivate func components(for durationString: String) -> DateComponents {
    var components = DateComponents()
    
    guard durationString.hasPrefix("P") else {
        return components
    }
    
    let componentsString = String(durationString.dropFirst())
    var dateUnits: [(Calendar.Component, Int)]
    var timeUnits: [(Calendar.Component, Int)]?
    
    if let _ = componentsString.range(of: "W") {
        let weekUnits = units(for: componentsString, mappings: weekUnitMappings)
        for (component, value) in weekUnits {
            components.setValue(value, for: component)
        }
        
        return components
    }
    
    if let separatorRange = componentsString.range(of: "T") {
        let date = String(componentsString[..<separatorRange.lowerBound])
        let time = String(componentsString[separatorRange.upperBound...])
        dateUnits = units(for: date, mappings: dateUnitMappings)
        timeUnits = units(for: time, mappings: timeUnitMappings)
    } else {
        dateUnits = units(for: componentsString, mappings: dateUnitMappings)
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

fileprivate func durationString(from dateComponents: DateComponents) -> String {
    var duration: String = "P"
    
    if let weeks = dateComponents.weekOfYear {
        duration.append("\(weeks)W")
        return duration
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
    
    return duration
}
