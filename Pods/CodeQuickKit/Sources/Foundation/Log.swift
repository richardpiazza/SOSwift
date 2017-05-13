//===----------------------------------------------------------------------===//
//
// LogManager.swift
//
// Copyright (c) 2017 Richard Piazza
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

/// A general purpose logging class providing console, file, and observer logging
/// abilities.
/// - note: CodeQuickKit uses this class for its logging.
public struct Log {
    public private(set) static var observers: [LogObserver] = [LogObserver]()
    public static var consoleLevel: LogLevel = .debug
    public static var writeToFile: Bool = false {
        didSet {
            if writeToFile {
                add(observer: LogFile.default)
            } else {
                remove(observer: LogFile.default)
            }
        }
    }
    
    // MARK: - Observers
    private static func index(of observer: LogObserver) -> Array<LogObserver>.Index? {
        let index = observers.index { (o) -> Bool in
            return o.isEqual(observers)
        }
        
        return index
    }
    
    public static func add(observer: LogObserver) {
        if let _ = index(of: observer) {
            return
        }
        
        observers.append(observer)
    }
    
    public static func remove(observer: LogObserver) {
        guard let index = index(of: observer) else {
            return
        }
        
        observers.remove(at: index)
    }
    
    // MARK: - Logging
    public static func debug(file: String = #file, line: Int = #line, _ message: String) {
        log(.debug, file: file, line: line, message: message, error: nil)
    }
    
    public static func info(file: String = #file, line: Int = #line, _ message: String) {
        log(.info, file: file, line: line, message: message, error: nil)
    }
    
    public static func warn(file: String = #file, line: Int = #line, _ message: String) {
        log(.warn, file: file, line: line, message: message, error: nil)
    }
    
    public static func error(file: String = #file, line: Int = #line, _ message: String? = nil, error: NSError) {
        log(.error, file: file, line: line, message: message, error: error)
    }
    
    public static func error(file: String = #file, line: Int = #line, _ error: Error) {
        log(.error, file: file, line: line, message: nil, error: error as NSError)
    }
    
    private static func log(_ level: LogLevel, file: String, line: Int, message: String? = nil, error: NSError? = nil) {
        let log = Log(level, file: file, line: line, message: message, error: error)
        
        if level.rawValue >= consoleLevel.rawValue {
            NSLog("%@", log.stringValue)
        }
        
        for observer in observers {
            observer.log(log)
        }
    }
    
    public var level: LogLevel
    public var file: String
    public var line: Int
    public var message: String?
    public var error: NSError?
    
    public init(_ level: LogLevel, file: String = #file, line: Int = #line, message: String? = nil, error: NSError? = nil) {
        self.level = level
        self.file = file
        self.line = line
        self.message = message
        self.error = error
    }
    
    public var stringValue: String {
        let url = URL(fileURLWithPath: file)
        
        if let m = message, let e = error {
            return "[\(level.gem) \(level.fixedSpaceStringValue) \(url.lastPathComponent) \(line)] \(m) | \(e)"
        } else if let m = message {
            return "[\(level.gem) \(level.fixedSpaceStringValue) \(url.lastPathComponent) \(line)] \(m)"
        } else if let e = error {
            return "[\(level.gem) \(level.fixedSpaceStringValue) \(url.lastPathComponent) \(line)] \(e)"
        } else {
            return "[\(level.gem) \(level.fixedSpaceStringValue) \(url.lastPathComponent) \(line)]"
        }
    }
}

public enum LogLevel: Int {
    case debug = 0
    case info = 1
    case warn = 2
    case error = 3
    
    public var stringValue: String {
        switch self {
        case .debug: return "Debug"
        case .info: return "Info"
        case .warn: return "Warn"
        case .error: return "Error"
        }
    }
    
    /// A string with fixed spacing, representing the log levels.
    public var fixedSpaceStringValue: String {
        return stringValue.padding(toLength: 5, withPad: " ", startingAt: 0)
    }
    
    /// A string with a colored emoji representing the log levels.
    public var gem: String {
        switch self {
        case .debug: return "⚪️"
        case .info: return "⚫️"
        case .warn: return "🔵"
        case .error: return "🔴"
        }
    }
}

public protocol LogObserver: NSObjectProtocol {
    func log(_ log: Log)
}

/// A Simple class conforming to `LogObserver` that writes `Log`s to a file on disk.
public class LogFile: NSObject, LogObserver {
    public static var `default`: LogFile = LogFile(fileName: "log.txt", autoPurge: true)
    
    private static var fileDirectory: URL {
        var urls: [URL]
        #if os(tvOS)
            urls = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask)
        #else
            urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        #endif
        
        guard let url = urls.last else {
            fatalError("Could not find url for storage directory.")
        }
        
        return url
    }
    
    public var url: URL
    public var logLevel: LogLevel
    
    public init(url: URL, logLevel: LogLevel = .error, autoPurge: Bool = false) {
        self.url = url
        self.logLevel = logLevel
        super.init()
        
        if autoPurge {
            self.autoPurge()
        }
    }
    
    public convenience init(fileName: String, logLevel: LogLevel = .error, autoPurge: Bool = false) {
        let url = type(of: self).fileDirectory.appendingPathComponent(fileName)
        self.init(url: url, logLevel: logLevel, autoPurge: autoPurge)
    }
    
    public func log(_ log: Log) {
        guard log.level.rawValue >= logLevel.rawValue else {
            return
        }
        
        guard let data = log.stringValue.appending("\n").data(using: .utf8) else {
            return
        }
        
        guard FileManager.default.fileExists(atPath: url.path) else {
            do {
                try data.write(to: url, options: .atomic)
            } catch {
                NSLog("%@", error as NSError)
            }
            return
        }
        
        var handle: FileHandle
        do {
            handle = try FileHandle(forWritingTo: url)
        } catch {
            NSLog("%@", error as NSError)
            return
        }
        
        handle.seekToEndOfFile()
        handle.write(data)
        handle.closeFile()
    }
    
    /// Automatically purges the file at `URL` when reaching `bytes`.
    /// By default this will purge at 1MB.
    public func autoPurge(_ bytes: UInt = (1024 * 1024 * 1)) {
        guard FileManager.default.fileExists(atPath: url.path) else {
            return
        }
        
        let attributes: [FileAttributeKey : Any]
        do {
            attributes = try FileManager.default.attributesOfItem(atPath: url.path)
        } catch {
            NSLog("%@", error as NSError)
            return
        }
        
        guard let fileBytes = attributes[FileAttributeKey.size] as? UInt else {
            return
        }
        
        guard fileBytes < bytes else {
            return
        }
        
        purge()
    }
    
    public func purge() {
        guard FileManager.default.fileExists(atPath: url.path) else {
            return
        }
        
        do {
            try FileManager.default.removeItem(at: url)
        } catch {
            NSLog("%@", error as NSError)
        }
    }
    
    public var data: Data? {
        guard FileManager.default.fileExists(atPath: url.path) else {
            return nil
        }
        
        var data: Data
        do {
            data = try Data(contentsOf: url)
        } catch {
            NSLog("%@", error as NSError)
            return nil
        }
        
        return data
    }
}
