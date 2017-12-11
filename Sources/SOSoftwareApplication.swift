import Foundation
import SOSwiftVocabulary

/// A software application.
public class SOSoftwareApplication: SOCreativeWork, SoftwareApplication {
    
    public override class var type: String {
        return "SoftwareApplication"
    }
    
    /// Type of software application, e.g. 'Game, Multimedia'.
    public var applicationCategory: URLOrText?
    /// Subcategory of the application, e.g. 'Arcade Game'.
    public var applicationSubCategory: URLOrText?
    /// The name of the application suite to which the application belongs (e.g. Excel belongs to Office).
    public var applicationSuite: String?
    /// Device required to run the application. Used in cases where a specific make/model is required to run the application.
    public var availableOnDevice: String?
    /// Countries for which the application is not supported. You can also provide the two-letter ISO 3166-1 alpha-2 country code.
    public var countriesNotSupported: String?
    /// Countries for which the application is supported. You can also provide the two-letter ISO 3166-1 alpha-2 country code.
    public var countriesSupported: String?
    /// If the file can be downloaded, URL to download the binary.
    public var downloadUrl: URL?
    /// Features or modules provided by this application (and possibly required by other applications).
    public var featureList: URLOrText?
    /// Size of the application / package (e.g. 18MB). In the absence of a unit (MB, KB etc.), KB will be assumed.
    public var fileSize: String?
    /// URL at which the app may be installed, if different from the URL of the item.
    public var installUrl: URL?
    /// Minimum memory requirements.
    public var memoryRequirements: URLOrText?
    /// Operating systems supported (Windows 7, OSX 10.6, Android 1.6).
    public var operatingSystem: String?
    /// Permission(s) required to run the app (for example, a mobile app may require full internet access or may run only on wifi).
    public var permissions: String?
    /// Processor architecture required to run the application (e.g. IA64).
    public var processorRequirements: String?
    /// Description of what changed in this version.
    public var releaseNotes: URLOrText?
    /// A link to a screenshot image of the app.
    public var screenshot: ImageObjectOrURL?
    /// Additional content for a software application.
    public var softwareAddOn: SoftwareApplication?
    /// Software application help.
    public var softwareHelp: CreativeWork?
    /// Component dependency requirements for application. This includes runtime environments and shared libraries that are not included in the application distribution package, but required to run the application (Examples: DirectX, Java or .NET runtime).
    public var softwareRequirements: URLOrText?
    /// Version of the software instance.
    public var softwareVersion: String?
    /// Storage requirements (free space required).
    public var storageRequirements: URLOrText?
    /// Supporting data for a SoftwareApplication.
    public var supportingData: DataFeed?
    
    private enum CodingKeys: String, CodingKey {
        case applicationCategory
        case applicationSubCategory
        case applicationSuite
        case availableOnDevice
        case countriesNotSupported
        case countriesSupported
        case downloadUrl
        case featureList
        case fileSize
        case installUrl
        case memoryRequirements
        case operatingSystem
        case permissions
        case processorRequirements
        case releaseNotes
        case screenshot
        case softwareAddOn
        case softwareHelp
        case softwareRequirements
        case softwareVersion
        case storageRequirements
        case supportingData
    }
    
    public override init() {
        super.init()
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.applicationCategory = try container.decodeURLOrTextIfPresent(forKey: .applicationCategory)
        self.applicationSubCategory = try container.decodeURLOrTextIfPresent(forKey: .applicationSubCategory)
        self.applicationSuite = try container.decodeIfPresent(String.self, forKey: .applicationSuite)
        self.availableOnDevice = try container.decodeIfPresent(String.self, forKey: .availableOnDevice)
        self.countriesNotSupported = try container.decodeIfPresent(String.self, forKey: .countriesNotSupported)
        self.countriesSupported = try container.decodeIfPresent(String.self, forKey: .countriesSupported)
        self.downloadUrl = try container.decodeIfPresent(URL.self, forKey: .downloadUrl)
        self.featureList = try container.decodeURLOrTextIfPresent(forKey: .featureList)
        self.fileSize = try container.decodeIfPresent(String.self, forKey: .fileSize)
        self.installUrl = try container.decodeIfPresent(URL.self, forKey: .installUrl)
        self.memoryRequirements = try container.decodeURLOrTextIfPresent(forKey: .memoryRequirements)
        self.operatingSystem = try container.decodeIfPresent(String.self, forKey: .operatingSystem)
        self.permissions = try container.decodeIfPresent(String.self, forKey: .permissions)
        self.processorRequirements = try container.decodeIfPresent(String.self, forKey: .processorRequirements)
        self.releaseNotes = try container.decodeURLOrTextIfPresent(forKey: .releaseNotes)
        self.screenshot = try container.decodeImageObjectOrURLIfPresent(forKey: .screenshot)
        self.softwareAddOn = try container.decodeIfPresent(SOSoftwareApplication.self, forKey: .softwareAddOn)
        self.softwareHelp = try container.decodeIfPresent(SOCreativeWork.self, forKey: .softwareHelp)
        self.softwareVersion = try container.decodeIfPresent(String.self, forKey: .softwareVersion)
        self.softwareRequirements = try container.decodeURLOrTextIfPresent(forKey: .softwareRequirements)
        self.storageRequirements = try container.decodeURLOrTextIfPresent(forKey: .storageRequirements)
        
        try super.init(from: decoder)
    }
    
    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encodeIfPresent(self.applicationCategory, forKey: .applicationCategory)
        try container.encodeIfPresent(self.applicationSubCategory, forKey: .applicationSubCategory)
        try container.encodeIfPresent(self.applicationSuite, forKey: .applicationSuite)
        try container.encodeIfPresent(self.availableOnDevice, forKey: .availableOnDevice)
        try container.encodeIfPresent(self.countriesNotSupported, forKey: .countriesNotSupported)
        try container.encodeIfPresent(self.countriesSupported, forKey: .countriesSupported)
        try container.encodeIfPresent(self.downloadUrl, forKey: .downloadUrl)
        try container.encodeIfPresent(self.featureList, forKey: .featureList)
        try container.encodeIfPresent(self.fileSize, forKey: .fileSize)
        try container.encodeIfPresent(self.installUrl, forKey: .installUrl)
        try container.encodeIfPresent(self.memoryRequirements, forKey: .memoryRequirements)
        try container.encodeIfPresent(self.operatingSystem, forKey: .operatingSystem)
        try container.encodeIfPresent(self.permissions, forKey: .permissions)
        try container.encodeIfPresent(self.processorRequirements, forKey: .processorRequirements)
        try container.encodeIfPresent(self.releaseNotes, forKey: .releaseNotes)
        try container.encodeIfPresent(self.screenshot, forKey: .screenshot)
        try container.encodeIfPresent(self.softwareAddOn, forKey: .softwareAddOn)
        try container.encodeIfPresent(self.softwareHelp, forKey: .softwareHelp)
        try container.encodeIfPresent(self.softwareRequirements, forKey: .softwareRequirements)
        try container.encodeIfPresent(self.softwareVersion, forKey: .softwareVersion)
        try container.encodeIfPresent(self.storageRequirements, forKey: .storageRequirements)
        try container.encodeIfPresent(self.supportingData, forKey: .supportingData)
        
        try super.encode(to: encoder)
    }
}

public extension KeyedEncodingContainer {
    public mutating func encodeIfPresent(_ value: SoftwareApplication?, forKey key: K) throws {
        if let typedValue = value as? SOSoftwareApplication {
            try self.encode(typedValue, forKey: key)
        }
    }
}
