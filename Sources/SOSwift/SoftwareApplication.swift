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
    
}
