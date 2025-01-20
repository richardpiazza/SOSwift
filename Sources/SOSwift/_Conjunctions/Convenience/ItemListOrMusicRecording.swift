public typealias ItemListOrMusicRecording = SingleSchemaConjunction<ItemList, MusicRecording>

public extension ItemListOrMusicRecording {
    var itemList: ItemList? { first }
    var musicRecording: MusicRecording? { second }

    static func itemList(value: ItemList) -> Self {
        .first(value)
    }

    static func musicRecording(value: MusicRecording) -> Self {
        .second(value)
    }
}
