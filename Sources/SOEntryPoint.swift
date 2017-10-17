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
    
    private enum CodingKeys: String, CodingKey {
        case actionApplication
        case actionPlatform
        case contentType
        case encodingType
        case httpMethod
        case urlTemplate
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        if let value = try container.decodeIfPresent(SOSoftwareApplication.self, forKey: .actionApplication) {
            self.actionApplication = value
        }
        if let value = try container.decodeTextOrURLIfPresent(forKey: .actionPlatform) {
            self.actionPlatform = value
        }
        if let value = try container.decodeIfPresent(String.self, forKey: .contentType) {
            self.contentType = value
        }
        if let value = try container.decodeIfPresent(String.self, forKey: .encodingType) {
            self.encodingType = value
        }
        if let value = try container.decodeIfPresent(String.self, forKey: .httpMethod) {
            self.httpMethod = value
        }
        if let value = try container.decodeIfPresent(String.self, forKey: .urlTemplate) {
            self.urlTemplate = value
        }
        
        let superDecoder = try container.superDecoder()
        try super.init(from: superDecoder)
    }
    
    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        if let value = self.actionApplication as? SOSoftwareApplication {
            try container.encode(value, forKey: .actionApplication)
        }
        if let value = self.actionPlatform {
            try container.encodeTextOrURL(value, forKey: .actionPlatform)
        }
        if let value = self.contentType {
            try container.encode(value, forKey: .contentType)
        }
        if let value = self.encodingType {
            try container.encode(value, forKey: .encodingType)
        }
        if let value = self.httpMethod {
            try container.encode(value, forKey: .httpMethod)
        }
        if let value = self.urlTemplate {
            try container.encode(value, forKey: .urlTemplate)
        }
        
        let superEncoder = container.superEncoder()
        try super.encode(to: superEncoder)
    }
}
