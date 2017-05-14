import Foundation

/// A PublicationEvent corresponds indifferently to the event of publication for a CreativeWork of any type e.g. a broadcast event, an on-demand event, a book/journal publication via a variety of delivery media.
public protocol PublicationEvent: Event {
    /// A broadcast service associated with the publication event.
    var publishedOn: BroadcastService? { get set }
}

