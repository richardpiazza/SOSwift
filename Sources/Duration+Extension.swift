import Foundation
import SOSwiftVocabulary

// Inspired From: https://github.com/Igor-Palaguta/YoutubeEngine/blob/master/Source/YoutubeEngine/Parser/NSDateComponents%2BISO8601.swift
fileprivate struct DurationFormatter {
    var duration: Duration
    
    init(_ duration: Duration) {
        self.duration = duration
    }
    
    private let dateUnitMappings: [Character : Calendar.Component] = ["Y": .year, "M": .month, "W": .weekOfYear, "D": .day]
    private let timeUnitMappings: [Character : Calendar.Component] = ["H": .hour, "M": .minute, "S": .second]
    
    var dateComponents: DateComponents {
        var components = DateComponents()
        
        guard let value = self.duration as? String, value.hasPrefix("P") else {
            return components
        }
        
        let durationString = String(value.dropFirst())
        var dateUnits: [(Calendar.Component, Int)]
        var timeUnits: [(Calendar.Component, Int)]?
        
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
    
    func units(for durationString: String, mappings: [Character : Calendar.Component]) -> [(Calendar.Component, Int)] {
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
            var identifier: NSString?
            if !scanner.scanCharacters(from: identifiersSet, into: &identifier) || identifier?.length != 1 {
                return components
            }
            
            let unit = mappings[Character(identifier! as String)]!
            
            components.append((unit, value))
        }
        
        return components
    }
}

public extension Duration {
    var dateComponents: DateComponents {
        return DurationFormatter(self).dateComponents
    }
}

// MARK: - Duration

public extension KeyedEncodingContainer {
    public mutating func encodeIfPresent(_ value: Duration?, forKey key: K) throws {
        if let typedValue = value as? String {
            try self.encode(typedValue, forKey: key)
        }
    }
}

public extension KeyedDecodingContainer {
    public func decodeDurationIfPresent(forKey key: K) throws -> Duration? {
        guard self.contains(key) else {
            return nil
        }
        
        do {
            let value = try self.decode(String.self, forKey: key)
            return value
        } catch {
        }
        
        print("Failed to decode `Duration` for key: \(key.stringValue).")
        
        return nil
    }
}
