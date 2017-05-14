import Foundation

public protocol SoftwareApplicationConformance:
                    SoftwareApplicationOrWebsite
                {}

/// A software application.
public protocol SoftwareApplication: CreativeWork, SoftwareApplicationConformance {
    /// Type of software application, e.g. 'Game, Multimedia'.
    var applicationCategory: TextOrURL? { get set }
    /// Subcategory of the application, e.g. 'Arcade Game'.
    var applicationSubCategory: TextOrURL? { get set }
    /// The name of the application suite to which the application belongs (e.g. Excel belongs to Office).
    var applicationSuite: String? { get set }
    /// Device required to run the application. Used in cases where a specific make/model is required to run the application.
    var availableOnDevice: String? { get set }
    /// Countries for which the application is not supported. You can also provide the two-letter ISO 3166-1 alpha-2 country code.
    var countriesNotSupported: String? { get set }
    /// Countries for which the application is supported. You can also provide the two-letter ISO 3166-1 alpha-2 country code.
    var countriesSupported: String? { get set }
    /// If the file can be downloaded, URL to download the binary.
    var downloadUrl: URL? { get set }
    /// Features or modules provided by this application (and possibly required by other applications).
    var featureList: TextOrURL? { get set }
    /// Size of the application / package (e.g. 18MB). In the absence of a unit (MB, KB etc.), KB will be assumed.
    var fileSize: String? { get set }
    /// URL at which the app may be installed, if different from the URL of the item.
    var installUrl: URL? { get set }
    /// Minimum memory requirements.
    var memoryRequirements: TextOrURL? { get set }
    /// Operating systems supported (Windows 7, OSX 10.6, Android 1.6).
    var operatingSystem: String? { get set }
    /// Permission(s) required to run the app (for example, a mobile app may require full internet access or may run only on wifi).
    var permissions: String? { get set }
    /// Processor architecture required to run the application (e.g. IA64).
    var processorRequirements: String? { get set }
    /// Description of what changed in this version.
    var releaseNotes: TextOrURL? { get set }
    /// A link to a screenshot image of the app.
    var screenshot: ImageObjectOrURL? { get set }
    /// Additional content for a software application.
    var softwareAddOn: SoftwareApplication? { get set }
    /// Software application help.
    var softwareHelp: CreativeWork? { get set }
    /// Component dependency requirements for application. This includes runtime environments and shared libraries that are not included in the application distribution package, but required to run the application (Examples: DirectX, Java or .NET runtime).
    var softwareRequirements: TextOrURL? { get set }
    /// Version of the software instance.
    var softwareVersion: String? { get set }
    /// Storage requirements (free space required).
    var storageRequirements: TextOrURL? { get set }
    /// Supporting data for a SoftwareApplication.
    var supportingData: DataFeed? { get set }
}
