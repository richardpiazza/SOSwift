import Foundation
import SOSwiftVocabulary

// MARK: - ItemListOrMusicRecording

public extension KeyedEncodingContainer {
    mutating func encodeIfPresent(_ value: ItemListOrMusicRecording?, forKey key: K) throws {
        if let typedValue = value as? SOItemList {
            try self.encode(typedValue, forKey: key)
        } else if let typedValue = value as? SOMusicRecording {
            try self.encode(typedValue, forKey: key)
        }
    }
    
    mutating func encodeIfPresent(_ values: [ItemListOrMusicRecording]?, forKey key: K) throws {
        guard let values = values else {
            return
        }
        
        var subcontainer = self.nestedUnkeyedContainer(forKey: key)
        
        for value in values {
            if let typedValue = value as? SOItemList {
                try subcontainer.encode(typedValue)
            } else if let typedValue = value as? SOMusicRecording {
                try subcontainer.encode(typedValue)
            }
        }
    }
}

public extension KeyedDecodingContainer {
    func decodeItemListOrMusicRecordingIfPresent(forKey key: K) throws -> ItemListOrMusicRecording? {
        guard self.contains(key) else {
            return nil
        }
        
        do {
            let dictionary = try self.decode(Dictionary<String, Any>.self, forKey: key)
            if dictionary[SOThing.Keywords.type] as? String == SOItemList.type {
                return try self.decode(SOItemList.self, forKey: key)
            } else if dictionary[SOThing.Keywords.type] as? String == SOMusicRecording.type {
                return try self.decode(SOMusicRecording.self, forKey: key)
            }
        } catch {
        }
        
        print("Failed to decode `ItemListOrMusicRecording` for key: \(key.stringValue).")
        
        return nil
    }
    
    func decodeItemListsOrMusicRecordingsIfPresent(forKey key: K) throws -> [ItemListOrMusicRecording]? {
        guard self.contains(key) else {
            return nil
        }
        
        var decodables = [ItemListOrMusicRecording]()
        
        do {
            let array = try self.decode([Any].self, forKey: key)
            for element in array {
                if let dictionary = element as? [String : Any] {
                    let data = try JSONSerialization.data(withJSONObject: dictionary, options: JSONSerialization.WritingOptions())
                    if dictionary[SOThing.Keywords.type] as? String == SOItemList.type {
                        let decodable = try JSONDecoder().decode(SOItemList.self, from: data)
                        decodables.append(decodable)
                    } else if dictionary[SOThing.Keywords.type] as? String == SOMusicRecording.type {
                        let decodable = try JSONDecoder().decode(SOMusicRecording.self, from: data)
                        decodables.append(decodable)
                    }
                }
            }
            
            return decodables
        } catch {
        }
        
        do {
            if let element = try self.decodeItemListOrMusicRecordingIfPresent(forKey: key) {
                return [element]
            }
        } catch {
        }
        
        print("Failed to decode `[ItemListOrMusicRecording]` for key: \(key.stringValue).")
        
        return nil
    }
}
