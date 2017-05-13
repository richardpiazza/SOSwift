//===----------------------------------------------------------------------===//
//
// Logger.swift
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

@available(*, deprecated, message: "use `LogLevel` instead")
public enum LoggerLevel: Int {
    case verbose = 0
    case debug = 1
    case info = 2
    case warn = 3
    case error = 4
    case exception = 5
    
    var description: String {
        switch self {
        case .verbose: return "Verbose"
        case .debug: return "Debug"
        case .info: return "Info"
        case .warn: return "Warn"
        case .error: return "Error"
        case .exception: return "Exception"
        }
    }
}

@available(*, deprecated, message: "use `LogObserver` instead")
public protocol LoggerAgent {
    func log(_ level: LoggerLevel, message: String?, error: NSError?, type: AnyClass?)
}

/// Provides a single logger that allows for extension by proxying requests to `LoggerAgents`.
/// The classes in CodeQuickKit use the Logger, add a `LoggerAgent` if you wish to process the log to another service.
@available(*, deprecated, message: "use `Log` instead")
public class Logger {
    public static var minimumConsoleLevel: LoggerLevel = .debug
    public static var agents: [LoggerAgent] = [LoggerAgent]()
    
    public static func verbose(_ message: String, callingClass: AnyClass? = nil) {
        log(.verbose, message: message, error: nil, type: callingClass)
    }
    
    public static func debug(_ message: String, callingClass: AnyClass? = nil) {
        log(.debug, message: message, error: nil, type: callingClass)
    }
    
    public static func info(_ message: String, callingClass: AnyClass? = nil) {
        log(.info, message: message, error: nil, type: callingClass)
    }
    
    public static func warn(_ message: String, callingClass: AnyClass? = nil) {
        log(.warn, message: message, error: nil, type: callingClass)
    }
    
    public static func error(_ error: NSError?, message: String, callingClass: AnyClass? = nil) {
        log(.error, message: message, error: error, type: callingClass)
    }
    
    public static func exception(_ exception: NSException?, message: String, callingClass: AnyClass? = nil) {
        var error: NSError?
        if let ex = exception {
            var userInfo:[AnyHashable: Any] = [AnyHashable: Any]()
            userInfo[NSLocalizedDescriptionKey] = ex.name
            userInfo[NSLocalizedFailureReasonErrorKey] = ex.reason ?? "Unknown Reason"
            if let dictionary = ex.userInfo {
                for (key, value) in dictionary {
                    userInfo[key] = value
                }
            }
            error = NSError(domain: String(describing: self), code: 0, userInfo: userInfo)
        }
        log(.exception, message: message, error: error, type: callingClass)
    }
    
    public static func log(_ level: LoggerLevel, message: String?, error: NSError?, type: AnyClass?) {
        if level.rawValue >= minimumConsoleLevel.rawValue {
            let messageString = (message != nil) ? message! : ""
            let typeString = (type != nil) ? String(describing: type!) : String(describing: self)
            if let e = error {
                NSLog("[%@] %@ %@\n%@", level.description, typeString, messageString, e)
            } else {
                NSLog("[%@] %@ %@", level.description, typeString, messageString)
            }
        }
        
        for agent in agents {
            agent.log(level, message: message, error: error, type: type)
        }
    }
}
