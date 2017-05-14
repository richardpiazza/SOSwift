import Foundation

/// An audio file.
public protocol AudioObject: MediaObject {
    /// If this MediaObject is an AudioObject or VideoObject, the transcript of that object.
    var transcript: String? { get set }
}
