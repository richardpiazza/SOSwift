import Foundation

public protocol MusicRecordingConformance:
                    ItemListOrMusicRecording
                {}

/// A music recording (track), usually a single song.
public protocol MusicRecording: CreativeWork, MusicRecordingConformance {
}
