import Foundation
import SOSwiftVocabulary

/// A musical group, such as a band, an orchestra, or a choir. Can also be a solo musician.
public class SOMusicGroup: SOPerformingGroup, MusicGroup {
    public struct Keys {
        public static let album = "album"
        public static let genre = "genre"
        public static let track = "track"
    }
    
    override public class var type: String {
        return "MusicGroup"
    }
    
    /// A music album.
    public var album: [MusicAlbum]?
    /// Genre of the creative work, broadcast channel or group.
    public var genre: TextOrURL?
    /// A music recording (track) - usually a single song. If an ItemList is given, the list should contain items of type MusicRecording.
    public var track: [ItemListOrMusicRecording]?
    
    public required init(dictionary: [String : AnyObject]) {
        super.init(dictionary: dictionary)
        if let value = dictionary[Keys.album] {
            self.album = makeMusicAlbums(anyObject: value)
        }
        if let value = dictionary[Keys.genre] {
            self.genre = makeTextOrURL(anyObject: value)
        }
        if let value = dictionary[Keys.track] {
            self.track = makeItemListOrMusicRecordings(anyObject: value)
        }
    }
    
    override public var dictionary: [String : AnyObject] {
        var dictionary = super.dictionary
        if let value = self.album as? [SOMusicAlbum] {
            var values = [[String : AnyObject]]()
            for element in value {
                values.append(element.dictionary)
            }
            dictionary[Keys.album] = values as AnyObject
        }
        if let value = self.genre?.dictionaryValue {
            dictionary[Keys.genre] = value
        }
        if let value = self.track {
            var values = [AnyObject]()
            for element in value {
                if let item = element.dictionaryValue {
                    values.append(item)
                }
            }
            dictionary[Keys.album] = values as AnyObject
        }
        return dictionary
    }
}
