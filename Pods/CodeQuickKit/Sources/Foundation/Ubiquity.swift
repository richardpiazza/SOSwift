//===----------------------------------------------------------------------===//
//
// Ubiquity.swift
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

public enum UbiquityState {
    case disabled
    case deviceOnly
    case available
    
    public var description: String {
        switch self {
        case .disabled: return "Disabled"
        case .deviceOnly: return "Device Only"
        case .available: return "Available"
        }
    }
    
    public var longDescription: String {
        switch self {
        case .disabled: return "iCloud is not enabled on this device."
        case .deviceOnly: return "iCloud is enabled, but the application container does not exist."
        case .available: return "iCloud is enabled, and the application container is ready."
        }
    }
    
    public static var invalidUbiquityState: NSError {
        var userInfo = [String : AnyObject]()
        userInfo[NSLocalizedDescriptionKey] = "Invalid ubiquity state." as AnyObject?
        userInfo[NSLocalizedFailureReasonErrorKey] = "This application does not have access to a valid iCloud ubiquity container." as AnyObject?
        userInfo[NSLocalizedRecoverySuggestionErrorKey] = "Log into iCloud and initialize the ubiquity container." as AnyObject?
        return NSError(domain: String(describing: self), code: 0, userInfo: userInfo)
    }
}

public protocol UbiquityContainerDelegate {
    func ubiquityStateDidChange(_ oldState: UbiquityState, newState: UbiquityState)
}

open class UbiquityContainer: UbiquityContainerDelegate {
    public static let defaultContainer: UbiquityContainer = UbiquityContainer()
    
    public internal(set) var identifier: String?
    public internal(set) var directory: URL?
    public internal(set) var ubiquityIdentityToken = FileManager.default.ubiquityIdentityToken
    public var delegate: UbiquityContainerDelegate?
    
    public var ubiquityState: UbiquityState {
        guard let _ = ubiquityIdentityToken else {
            return .disabled
        }
        
        guard let _ = directory else {
            return .deviceOnly
        }
        
        return .available
    }
    
    public init(identifier: String? = nil, delegate: UbiquityContainerDelegate? = nil) {
        self.identifier = identifier
        self.delegate = delegate != nil ? delegate : self
        
        NotificationCenter.default.addObserver(self, selector: #selector(UbiquityContainer.ubiquityIdentityDidChange(_:)), name: NSNotification.Name.NSUbiquityIdentityDidChange, object: nil)
        
        let oldState = ubiquityState
        
        DispatchQueue.global(qos: .default).async { 
            self.directory = FileManager.default.url(forUbiquityContainerIdentifier: identifier)
            let newState = self.ubiquityState
            
            if let delegate = self.delegate {
                DispatchQueue.main.async(execute: {
                    delegate.ubiquityStateDidChange(oldState, newState: newState)
                })
            }
        }
    }
    
    @objc fileprivate func ubiquityIdentityDidChange(_ notification: Notification) {
        let oldState = ubiquityState
        self.ubiquityIdentityToken = FileManager.default.ubiquityIdentityToken
        let newState = ubiquityState
        
        if let delegate = self.delegate {
            delegate.ubiquityStateDidChange(oldState, newState: newState)
        }
    }
    
    public func ubiquityStateDidChange(_ oldState: UbiquityState, newState: UbiquityState) {
        Log.debug("Ubiquity State did change from '\(oldState.description)' to '\(newState.description)'")
    }
}
