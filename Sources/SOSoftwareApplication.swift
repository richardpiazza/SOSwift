import Foundation
import SOSwiftVocabulary

/// A software application.
public class SOSoftwareApplication: SOCreativeWork, SoftwareApplication {
    
    public override class var type: String {
        return "SoftwareApplication"
    }
    
    /// Type of software application, e.g. 'Game, Multimedia'.
    public var applicationCategory: TextOrURL?
    /// Subcategory of the application, e.g. 'Arcade Game'.
    public var applicationSubCategory: TextOrURL?
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
    public var featureList: TextOrURL?
    /// Size of the application / package (e.g. 18MB). In the absence of a unit (MB, KB etc.), KB will be assumed.
    public var fileSize: String?
    /// URL at which the app may be installed, if different from the URL of the item.
    public var installUrl: URL?
    /// Minimum memory requirements.
    public var memoryRequirements: TextOrURL?
    /// Operating systems supported (Windows 7, OSX 10.6, Android 1.6).
    public var operatingSystem: String?
    /// Permission(s) required to run the app (for example, a mobile app may require full internet access or may run only on wifi).
    public var permissions: String?
    /// Processor architecture required to run the application (e.g. IA64).
    public var processorRequirements: String?
    /// Description of what changed in this version.
    public var releaseNotes: TextOrURL?
    /// A link to a screenshot image of the app.
    public var screenshot: ImageObjectOrURL?
    /// Additional content for a software application.
    public var softwareAddOn: SoftwareApplication?
    /// Software application help.
    public var softwareHelp: CreativeWork?
    /// Component dependency requirements for application. This includes runtime environments and shared libraries that are not included in the application distribution package, but required to run the application (Examples: DirectX, Java or .NET runtime).
    public var softwareRequirements: TextOrURL?
    /// Version of the software instance.
    public var softwareVersion: String?
    /// Storage requirements (free space required).
    public var storageRequirements: TextOrURL?
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
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        if let value = try container.decodeTextOrURLIfPresent(forKey: .applicationCategory) {
            self.applicationCategory = value
        }
        if let value = try container.decodeTextOrURLIfPresent(forKey: .applicationSubCategory) {
            self.applicationSubCategory = value
        }
        if let value = try container.decodeIfPresent(String.self, forKey: .applicationSuite) {
            self.applicationSuite = value
        }
        if let value = try container.decodeIfPresent(String.self, forKey: .availableOnDevice) {
            self.availableOnDevice = value
        }
        if let value = try container.decodeIfPresent(String.self, forKey: .countriesNotSupported) {
            self.countriesNotSupported = value
        }
        if let value = try container.decodeIfPresent(String.self, forKey: .countriesSupported) {
            self.countriesSupported = value
        }
        if let value = try container.decodeIfPresent(URL.self, forKey: .downloadUrl) {
            self.downloadUrl = value
        }
        if let value = try container.decodeTextOrURLIfPresent(forKey: .featureList) {
            self.featureList = value
        }
        if let value = try container.decodeIfPresent(String.self, forKey: .fileSize) {
            self.fileSize = value
        }
        if let value = try container.decodeIfPresent(URL.self, forKey: .installUrl) {
            self.installUrl = value
        }
        if let value = try container.decodeTextOrURLIfPresent(forKey: .memoryRequirements) {
            self.memoryRequirements = value
        }
        if let value = try container.decodeIfPresent(String.self, forKey: .operatingSystem) {
            self.operatingSystem = value
        }
        if let value = try container.decodeIfPresent(String.self, forKey: .permissions) {
            self.permissions = value
        }
        if let value = try container.decodeIfPresent(String.self, forKey: .processorRequirements) {
            self.processorRequirements = value
        }
        if let value = try container.decodeTextOrURLIfPresent(forKey: .releaseNotes) {
            self.releaseNotes = value
        }
        if let value = try container.decodeImageObjectOrURLIfPresent(forKey: .screenshot) {
            self.screenshot = value
        }
        if let value = try container.decodeIfPresent(SOSoftwareApplication.self, forKey: .softwareAddOn) {
            self.softwareAddOn = value
        }
        if let value = try container.decodeIfPresent(SOCreativeWork.self, forKey: .softwareHelp) {
            self.softwareHelp = value
        }
        if let value = try container.decodeIfPresent(String.self, forKey: .softwareVersion) {
            self.softwareVersion = value
        }
        if let value = try container.decodeTextOrURLIfPresent(forKey: .softwareRequirements) {
            self.softwareRequirements = value
        }
        if let value = try container.decodeTextOrURLIfPresent(forKey: .storageRequirements) {
            self.storageRequirements = value
        }
        
        try super.init(from: decoder)
    }
    
    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        if let value = self.applicationCategory {
            try container.encodeTextOrURL(value, forKey: .applicationCategory)
        }
        if let value = self.applicationSubCategory {
            try container.encodeTextOrURL(value, forKey: .applicationSubCategory)
        }
        if let value = self.applicationSuite {
            try container.encode(value, forKey: .applicationSuite)
        }
        if let value = self.availableOnDevice {
            try container.encode(value, forKey: .availableOnDevice)
        }
        if let value = self.countriesNotSupported {
            try container.encode(value, forKey: .countriesNotSupported)
        }
        if let value = self.countriesSupported {
            try container.encode(value, forKey: .countriesSupported)
        }
        if let value = self.downloadUrl {
            try container.encode(value, forKey: .downloadUrl)
        }
        if let value = self.featureList {
            try container.encodeTextOrURL(value, forKey: .featureList)
        }
        if let value = self.fileSize {
            try container.encode(value, forKey: .fileSize)
        }
        if let value = self.installUrl {
            try container.encode(value, forKey: .installUrl)
        }
        if let value = self.memoryRequirements {
            try container.encodeTextOrURL(value, forKey: .memoryRequirements)
        }
        if let value = self.operatingSystem {
            try container.encode(value, forKey: .operatingSystem)
        }
        if let value = self.permissions {
            try container.encode(value, forKey: .permissions)
        }
        if let value = self.processorRequirements {
            try container.encode(value, forKey: .processorRequirements)
        }
        if let value = self.releaseNotes {
            try container.encodeTextOrURL(value, forKey: .releaseNotes)
        }
        if let value = self.screenshot {
            try container.encodeImageObjectOrURL(value, forKey: .screenshot)
        }
        if let value = self.softwareAddOn as? SOSoftwareApplication {
            try container.encode(value, forKey: .softwareAddOn)
        }
        if let value = self.softwareHelp as? SOCreativeWork {
            try container.encode(value, forKey: .softwareHelp)
        }
        if let value = self.softwareRequirements {
            try container.encodeTextOrURL(value, forKey: .softwareRequirements)
        }
        if let value = self.softwareVersion {
            try container.encode(value, forKey: .softwareVersion)
        }
        if let value = self.storageRequirements {
            try container.encodeTextOrURL(value, forKey: .storageRequirements)
        }
        if let value = self.supportingData as? SODataFeed {
            try container.encode(value, forKey: .supportingData)
        }
        
        try super.encode(to: encoder)
    }
}
