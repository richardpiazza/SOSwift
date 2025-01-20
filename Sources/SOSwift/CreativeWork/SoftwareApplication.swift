import Foundation

/// A software application.
public class SoftwareApplication: CreativeWork {

    /// Type of software application, e.g. 'Game, Multimedia'.
    public var applicationCategory: URLOrText?

    /// Subcategory of the application, e.g. 'Arcade Game'.
    public var applicationSubCategory: URLOrText?

    /// The name of the application suite to which the application belongs
    /// (e.g. Excel belongs to Office).
    public var applicationSuite: String?

    /// Device required to run the application. Used in cases where a specific
    /// make/model is required to run the application.
    public var availableOnDevice: String?

    /// Countries for which the application is not supported. You can also
    /// provide the two-letter ISO 3166-1 alpha-2 country code.
    public var countriesNotSupported: String?

    /// Countries for which the application is supported. You can also provide
    /// the two-letter ISO 3166-1 alpha-2 country code.
    public var countriesSupported: String?

    /// If the file can be downloaded, URL to download the binary.
    public var downloadUrl: URL?

    /// Features or modules provided by this application (and possibly required
    /// by other applications).
    public var featureList: URLOrText?

    /// Size of the application / package (e.g. 18MB). In the absence of a unit
    /// (MB, KB etc.), KB will be assumed.
    public var fileSize: String?

    /// URL at which the app may be installed, if different from the URL of the item.
    public var installUrl: URL?

    /// Minimum memory requirements.
    public var memoryRequirements: URLOrText?

    /// Operating systems supported (Windows 7, OSX 10.6, Android 1.6).
    public var operatingSystem: String?

    /// Permission(s) required to run the app (for example, a mobile app may require
    /// full internet access or may run only on wifi).
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

    /// Component dependency requirements for application. This includes runtime
    /// environments and shared libraries that are not included in the application
    /// distribution package, but required to run the application (Examples: DirectX,
    /// Java or .NET runtime).
    public var softwareRequirements: URLOrText?

    /// Version of the software instance.
    public var softwareVersion: String?

    /// Storage requirements (free space required).
    public var storageRequirements: URLOrText?

    /// Supporting data for a SoftwareApplication.
    public var supportingData: DataFeed?

    enum SoftwareApplicationCodingKey: String, CodingKey {
        case applicationCategory
        case applicationSubCategory
        case applicationSuite
        case availableOnDevice
        case countriesNotSupported
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

    override public init() {
        super.init()
    }

    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)

        let container = try decoder.container(keyedBy: SoftwareApplicationCodingKey.self)

        applicationCategory = try container.decodeIfPresent(URLOrText.self, forKey: .applicationCategory)
        applicationSubCategory = try container.decodeIfPresent(URLOrText.self, forKey: .applicationSubCategory)
        applicationSuite = try container.decodeIfPresent(String.self, forKey: .applicationSuite)
        availableOnDevice = try container.decodeIfPresent(String.self, forKey: .availableOnDevice)
        countriesNotSupported = try container.decodeIfPresent(String.self, forKey: .countriesNotSupported)
        downloadUrl = try container.decodeIfPresent(URL.self, forKey: .downloadUrl)
        featureList = try container.decodeIfPresent(URLOrText.self, forKey: .featureList)
        fileSize = try container.decodeIfPresent(String.self, forKey: .fileSize)
        installUrl = try container.decodeIfPresent(URL.self, forKey: .installUrl)
        memoryRequirements = try container.decodeIfPresent(URLOrText.self, forKey: .memoryRequirements)
        operatingSystem = try container.decodeIfPresent(String.self, forKey: .operatingSystem)
        permissions = try container.decodeIfPresent(String.self, forKey: .permissions)
        processorRequirements = try container.decodeIfPresent(String.self, forKey: .processorRequirements)
        releaseNotes = try container.decodeIfPresent(URLOrText.self, forKey: .releaseNotes)
        screenshot = try container.decodeIfPresent(ImageObjectOrURL.self, forKey: .screenshot)
        softwareAddOn = try container.decodeIfPresent(SoftwareApplication.self, forKey: .softwareAddOn)
        softwareHelp = try container.decodeIfPresent(CreativeWork.self, forKey: .softwareHelp)
        softwareRequirements = try container.decodeIfPresent(URLOrText.self, forKey: .softwareRequirements)
        softwareVersion = try container.decodeIfPresent(String.self, forKey: .softwareVersion)
        storageRequirements = try container.decodeIfPresent(URLOrText.self, forKey: .storageRequirements)
        supportingData = try container.decodeIfPresent(DataFeed.self, forKey: .supportingData)
    }

    override public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: SoftwareApplicationCodingKey.self)

        try container.encodeIfPresent(applicationCategory, forKey: .applicationCategory)
        try container.encodeIfPresent(applicationSubCategory, forKey: .applicationSubCategory)
        try container.encodeIfPresent(applicationSuite, forKey: .applicationSuite)
        try container.encodeIfPresent(availableOnDevice, forKey: .availableOnDevice)
        try container.encodeIfPresent(countriesNotSupported, forKey: .countriesNotSupported)
        try container.encodeIfPresent(downloadUrl, forKey: .downloadUrl)
        try container.encodeIfPresent(featureList, forKey: .featureList)
        try container.encodeIfPresent(fileSize, forKey: .fileSize)
        try container.encodeIfPresent(installUrl, forKey: .installUrl)
        try container.encodeIfPresent(memoryRequirements, forKey: .memoryRequirements)
        try container.encodeIfPresent(operatingSystem, forKey: .operatingSystem)
        try container.encodeIfPresent(permissions, forKey: .permissions)
        try container.encodeIfPresent(processorRequirements, forKey: .processorRequirements)
        try container.encodeIfPresent(releaseNotes, forKey: .releaseNotes)
        try container.encodeIfPresent(screenshot, forKey: .screenshot)
        try container.encodeIfPresent(softwareAddOn, forKey: .softwareAddOn)
        try container.encodeIfPresent(softwareHelp, forKey: .softwareHelp)
        try container.encodeIfPresent(softwareRequirements, forKey: .softwareRequirements)
        try container.encodeIfPresent(softwareVersion, forKey: .softwareVersion)
        try container.encodeIfPresent(storageRequirements, forKey: .storageRequirements)
        try container.encodeIfPresent(supportingData, forKey: .supportingData)

        try super.encode(to: encoder)
    }
}
