import Foundation
import SOSwiftVocabulary

/// An entry point, within some Web-based protocol.
public class SOEntryPoint: SOIntangible, EntryPoint {
    override public class var type: String {
        return "EntryPoint"
    }
    
    /// An application that can complete the request.
    public var actionApplication: SoftwareApplication?
    /// The high level platform(s) where the Action can be performed for the given URL. To specify a specific application or operating system instance, use actionApplication.
    public var actionPlatform: TextOrURL?
    /// The supported content type(s) for an EntryPoint response.
    public var contentType: String?
    /// The supported encoding type(s) for an EntryPoint request.
    public var encodingType: String?
    /// An HTTP method that specifies the appropriate HTTP method for a request to an HTTP EntryPoint. Values are capitalized strings as used in HTTP.
    public var httpMethod: String?
    /// An url template (RFC6570) that will be used to construct the target of the execution of the action.
    public var urlTemplate: String?
}
