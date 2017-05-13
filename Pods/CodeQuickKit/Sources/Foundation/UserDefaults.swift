//===----------------------------------------------------------------------===//
//
// UserDefaults.swift
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

/// ### UserDefault
/// A defined structure for storing information in `NSUserDefaults` and `NSUbiquitousKeyValueStore`.
/// The `timestamp` and optional `build` variables allow for comparisson during syncing.
public struct KeyValueItem {
    public var value: NSObject
    public var timestamp: Date = Date()
    public var build: String?
    
    public init(value: NSObject, timestamp: Date? = nil, build: String? = nil) {
        self.value = value
        if let date = timestamp {
            self.timestamp = date
        }
        self.build = build
    }
}

/// ### KeyValueStorage
/// A protocol declaring dictionary conformance.
/// - note: These methods are taken from `NSUbiquitousKeyValueStore`.
public protocol KeyValueStorage {
    func dictionary(forKey: String) -> [String : Any]?
    func set(_ aDictionary: [String : Any]?, forKey: String)
}

extension KeyValueStorage {
    func item(forKey: String) -> KeyValueItem? {
        guard let dictionary = self.dictionary(forKey: forKey) else {
            return nil
        }
        
        guard let value = dictionary[KeyValueUbiquityContainer.Keys.value] as? NSObject else {
            return nil
        }
        
        guard let timestamp = dictionary[KeyValueUbiquityContainer.Keys.timestamp] as? Date else {
            return nil
        }
        
        let build = dictionary[KeyValueUbiquityContainer.Keys.build] as? String
        
        return KeyValueItem(value: value, timestamp: timestamp, build: build)
    }
    
    func value(forKey: String) -> NSObject? {
        return item(forKey: forKey)?.value
    }
    
    func set(_ item: KeyValueItem, forKey: String) {
        var dictionary = [String : Any]()
        dictionary[KeyValueUbiquityContainer.Keys.value] = item.value
        dictionary[KeyValueUbiquityContainer.Keys.timestamp] = item.timestamp as NSObject?
        if let build = item.build {
            dictionary[KeyValueUbiquityContainer.Keys.build] = build
        }
        
        self.set(dictionary, forKey: forKey)
    }
    
    func setValue(_ value: NSObject, forKey: String) {
        self.set(KeyValueItem(value: value, timestamp: Date(), build: nil), forKey: forKey)
    }
}

extension UserDefaults: KeyValueStorage {
    public func set(_ aDictionary: [String : Any]?, forKey: String) {
        guard aDictionary != nil else {
            self.removeObject(forKey: forKey)
            return
        }
        
        guard let dictionary = aDictionary as? [String : NSObject] else {
            return
        }
        
        self.set(dictionary, forKey: forKey)
    }
}

extension NSUbiquitousKeyValueStore: KeyValueStorage {
    
}

public protocol KeyValueUbiquityContainerDelegate {
    func shouldReplace(_ existing: KeyValueItem, with new: KeyValueItem, forKey: String) -> Bool
    func didSet(_ item: KeyValueItem, forKey: String)
}

/// ### KeyValueUbiquityContainer
/// A subclass of `UbiquityContainer` that manages access to a `NSUbiquitousKeyValueStore` instance.
open class KeyValueUbiquityContainer: UbiquityContainer {
    public struct Keys {
        static let value = "value"
        static let timestamp = "timestamp"
        static let build = "build"
    }
    
    open var keyValueStore: NSUbiquitousKeyValueStore? {
        willSet {
            NotificationCenter.default.removeObserver(self, name: NSUbiquitousKeyValueStore.didChangeExternallyNotification, object: self.keyValueStore)
        }
        didSet {
            if let keyValueStore = self.keyValueStore {
                NotificationCenter.default.addObserver(self, selector: #selector(KeyValueUbiquityContainer.nsUbiquitiousKeyValueStoreDidChangeExternally(_:)), name: NSUbiquitousKeyValueStore.didChangeExternallyNotification, object: keyValueStore)
                keyValueStore.synchronize()
            }
        }
    }
    open var keyValueDelegate: KeyValueUbiquityContainerDelegate?
    
    convenience init(identifier: String?, delegate: UbiquityContainerDelegate?, keyValueDelegate: KeyValueUbiquityContainerDelegate?) {
        self.init(identifier: identifier, delegate: delegate)
        self.keyValueDelegate = keyValueDelegate
    }
    
    open override func ubiquityStateDidChange(_ oldState: UbiquityState, newState: UbiquityState) {
        switch newState {
        case .disabled:
            self.keyValueStore = nil
        default:
            self.keyValueStore = NSUbiquitousKeyValueStore.default()
        }
    }
    
    @objc func nsUbiquitiousKeyValueStoreDidChangeExternally(_ notification: Notification) {
        guard let keyValueStore = self.keyValueStore else {
            return
        }
        
        guard let dictionary = (notification as NSNotification).userInfo else {
            return
        }
        
        guard let changeReason = dictionary[NSUbiquitousKeyValueStoreChangeReasonKey] as? Int else {
            return
        }
        
        switch changeReason {
        case NSUbiquitousKeyValueStoreServerChange, NSUbiquitousKeyValueStoreInitialSyncChange:
            guard let changedKeys = dictionary[NSUbiquitousKeyValueStoreChangedKeysKey] as? [String] else {
                return
            }
            
            for key in changedKeys {
                guard let ubiquityItem = keyValueStore.item(forKey: key) else {
                    Log.debug("Removing NSUserDefaults object for key '\(key)'")
                    UserDefaults.standard.removeObject(forKey: key)
                    continue
                }
                
                guard let standardItem = UserDefaults.standard.item(forKey: key) else {
                    UserDefaults.standard.set(ubiquityItem, forKey: key)
                    if let delegate = keyValueDelegate {
                        delegate.didSet(ubiquityItem, forKey: key)
                    }
                    continue
                }
                
                var replace = true
                if let delegate = self.keyValueDelegate {
                    replace = delegate.shouldReplace(standardItem, with: ubiquityItem, forKey: key)
                }
                
                if replace {
                    UserDefaults.standard.set(ubiquityItem, forKey: key)
                    if let delegate = keyValueDelegate {
                        delegate.didSet(ubiquityItem, forKey: key)
                    }
                }
            }
        default: break
        }
        
        Log.debug("\(keyValueStore.dictionaryRepresentation)")
    }
}

public extension UserDefaults {
    public static var ubiquityUserDefaults: KeyValueUbiquityContainer = KeyValueUbiquityContainer()
    
    /// Attempts to set an item on `NSUbiquitousKeyValueStore`. Will fallback to `NSUserDefaults`
    public static func setItem(_ item: KeyValueItem, forKey key: String) {
        if let keyValueStore = UserDefaults.ubiquityUserDefaults.keyValueStore {
            keyValueStore.set(item, forKey: key)
            if let delegate = ubiquityUserDefaults.keyValueDelegate {
                delegate.didSet(item, forKey: key)
            }
        } else {
            UserDefaults.standard.set(item, forKey: key)
        }
    }
    
    /// Attemps to retrieve an item from `NSUbiquitousKeyValueStore`. Will fallback to `NSUserDefaults`
    public static func itemForKey(_ key: String) -> KeyValueItem? {
        if let item = UserDefaults.ubiquityUserDefaults.keyValueStore?.item(forKey: key) {
            return item
        }
        
        return UserDefaults.standard.item(forKey: key)
    }
}
