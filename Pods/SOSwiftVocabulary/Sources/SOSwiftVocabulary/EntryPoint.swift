import Foundation

/// An entry point, within some Web-based protocol.
public protocol EntryPoint: Intangible {
    /// An application that can complete the request.
    var actionApplication: SoftwareApplication? { get set }
    /// The high level platform(s) where the Action can be performed for the given URL. To specify a specific application or operating system instance, use actionApplication.
    var actionPlatform: URLOrText? { get set }
    /// The supported content type(s) for an EntryPoint response.
    var contentType: String? { get set }
    /// The supported encoding type(s) for an EntryPoint request.
    var encodingType: String? { get set }
    /// An HTTP method that specifies the appropriate HTTP method for a request to an HTTP EntryPoint. Values are capitalized strings as used in HTTP.
    var httpMethod: String? { get set }
    /// An url template (RFC6570) that will be used to construct the target of the execution of the action.
    var urlTemplate: String? { get set }
}
