//===----------------------------------------------------------------------===//
//
// Bundle.swift
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

public enum BundleConfiguration {
    case debug
    case testFlight
    case appStore
    
    public var description: String {
        switch self {
        case .debug: return "Debug"
        case .testFlight: return "TestFlight"
        case .appStore: return "App Store"
        }
    }
}

/// Extension on NSBundle that provides first level property access to common bundle items.
/// Also provides methods for determining class names in other modules.
public extension Bundle {
    
    public struct Keys {
        static let BundleName = "CFBundleName"
        static let BundleDisplayName = "CFBundleDisplayName"
        static let BundleExecutableName = "CFBundleExecutable"
        static let AppVersion = "CFBundleShortVersionString"
        static let BuildNumber = "CFBundleVersion"
        static let BundleIdentifier = "CFBundleIdentifier"
        static let LaunchScreen = "UILaunchStoryboardName"
        static let MainStoryboard = "UIMainStoryboardFile"
    }
    
    public var bundleName: String? { return self.object(forInfoDictionaryKey: Keys.BundleName) as? String }
    public var bundleDisplayName: String? { return self.object(forInfoDictionaryKey: Keys.BundleDisplayName) as? String }
    public var executableName: String? { return self.object(forInfoDictionaryKey: Keys.BundleExecutableName) as? String }
    public var appVersion: String? { return self.object(forInfoDictionaryKey: Keys.AppVersion) as? String }
    public var buildNumber: String? { return self.object(forInfoDictionaryKey: Keys.BuildNumber) as? String }
    public var launchScreenStoryboardName: String? { return self.object(forInfoDictionaryKey: Keys.LaunchScreen) as? String }
    public var mainStoryboardName: String? { return self.object(forInfoDictionaryKey: Keys.MainStoryboard) as? String }
    
    public var isSandboxReceipt: Bool { return appStoreReceiptURL?.lastPathComponent == "sandboxReceipt" }
    
    public var configuration: BundleConfiguration {
        return (isSandboxReceipt) ? .testFlight : .appStore
    }
    
    public var dictionary: [String : String] {
        return [
            Keys.BundleName : (bundleName == nil) ? "" : bundleName!,
            Keys.BundleDisplayName : (bundleDisplayName == nil) ? "" : bundleDisplayName!,
            Keys.BundleExecutableName : (executableName == nil) ? "" : executableName!,
            Keys.BundleIdentifier : (bundleIdentifier == nil) ? "" : bundleIdentifier!,
            Keys.AppVersion : (appVersion == nil) ? "" : appVersion!,
            Keys.BuildNumber : (buildNumber == nil) ? "" : buildNumber!,
            Keys.LaunchScreen : (launchScreenStoryboardName == nil) ? "" : launchScreenStoryboardName!,
            Keys.MainStoryboard : (mainStoryboardName == nil) ? "" : mainStoryboardName!,
            "Configuration" : configuration.description
        ]
    }
    
    public var data: Data? {
        do {
            return try JSONSerialization.data(withJSONObject: dictionary, options: .prettyPrinted)
        } catch {
            Log.error(error)
            return nil
        }
    }
    
    /// Attempts to determine the "full" modularized name for a given class.
    /// For example: when using CodeQuickKit as a module, the moduleClass for
    /// the `WebAPI` class would be `CodeQuickKit.WebAPI`.
    public func moduleClass(forClassNamed classNamed: String) -> AnyClass {
        var moduleClass: AnyClass? = NSClassFromString(classNamed)
        if moduleClass != nil && moduleClass != NSNull.self {
            return moduleClass!
        }
        
        if let prefix = bundleDisplayName {
            let underscored = prefix.replacingOccurrences(of: " " , with: "_")
            moduleClass = NSClassFromString("\(underscored).\(classNamed)")
            if moduleClass != nil && moduleClass != NSNull.self {
                return moduleClass!
            }
        }
        
        if let prefix = bundleName {
            let underscored = prefix.replacingOccurrences(of: " " , with: "_")
            moduleClass = NSClassFromString("\(underscored).\(classNamed)")
            if moduleClass != nil && moduleClass != NSNull.self {
                return moduleClass!
            }
        }
        
        return NSNull.self
    }
    
    /// Takes the moduleClass for a given class and attempts to singularize it.
    public func singularizedModuleClass(forClassNamed classNamed: String) -> AnyClass {
        var moduleClass: AnyClass? = self.moduleClass(forClassNamed: classNamed)
        if moduleClass != nil && moduleClass != NSNull.self {
            return moduleClass!
        }
        
        let firstRange = classNamed.startIndex..<classNamed.characters.index(classNamed.startIndex, offsetBy: 1)
        let endRange = classNamed.characters.index(classNamed.endIndex, offsetBy: -1)..<classNamed.endIndex
        
        var singular = classNamed
        singular.replaceSubrange(firstRange, with: singular.substring(with: firstRange).uppercased())
        if singular.lowercased().hasSuffix("s") {
            singular.replaceSubrange(endRange, with: "")
        }
        
        moduleClass = self.moduleClass(forClassNamed: singular)
        if moduleClass != nil && moduleClass != NSNull.self {
            return moduleClass!
        }
        
        return NSNull.self
    }
}
