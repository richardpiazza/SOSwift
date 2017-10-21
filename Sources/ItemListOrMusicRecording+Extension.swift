import Foundation
import SOSwiftVocabulary

// MARK: - ItemListOrMusicRecording

public extension KeyedEncodingContainer {
    public mutating func encodeItemListOrMusicRecording(_ value: ItemListOrMusicRecording, forKey key: K) throws {
        if let typedValue = value as? SOItemList {
            try self.encode(typedValue, forKey: key)
        } else if let typedValue = value as? SOMusicRecording {
            try self.encode(typedValue, forKey: key)
        }
    }
    
    public mutating func encodeItemListsOrMusicRecordings(_ value: [ItemListOrMusicRecording], forKey key: K) throws {
        var encodables = [Encodable]()
        
        for element in value {
            if let typedValue = element as? SOItemList {
                encodables.append(typedValue)
            } else if let typedValue = element as? SOMusicRecording {
                encodables.append(typedValue)
            }
        }
        
        try self.encode(encodables, forKey: key)
    }
}

public extension KeyedDecodingContainer {
    public func decodeItemListOrMusicRecordingIfPresent(forKey key: K) throws -> ItemListOrMusicRecording? {
        guard self.contains(key) else {
            return nil
        }
        
        do {
            let value = try self.decode([String : AnyObject].self, forKey: key)
            if value["@type"] as? String == SOItemList.type {
                let data = try JSONEncoder().encode(value)
                return try JSONDecoder().decode(SOItemList.self, from: data)
            } else if value["@type"] as? String == SOMusicRecording.type {
                let data = try JSONEncoder().encode(value)
                return try JSONDecoder().decode(SOMusicRecording.self, from: data)
            }
        } catch {
            print(error)
        }
        
        return nil
    }
    
    public func decodeItemListsOrMusicRecordingsIfPresent(forKey key: K) throws -> [ItemListOrMusicRecording]? {
        guard self.contains(key) else {
            return nil
        }
        
        var decodables = [ItemListOrMusicRecording]()
        
        do {
            let values = try self.decode([[String : AnyObject]].self, forKey: key)
            for value in values {
                let data = try JSONEncoder().encode(value)
                
                if value["@type"] as? String == SOItemList.type {
                    let decodable = try JSONDecoder().decode(SOItemList.self, from: data)
                    decodables.append(decodable)
                } else if value["@type"] as? String == SOMusicRecording.type {
                    let decodable = try JSONDecoder().decode(SOMusicRecording.self, from: data)
                    decodables.append(decodable)
                }
            }
            
            return decodables
        } catch {
            print(error)
        }
        
        return nil
    }
}
