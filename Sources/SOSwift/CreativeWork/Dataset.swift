import Foundation

public class Dataset: CreativeWork {
    
    /// A downloadable form of this dataset, at a specific location, in a
    /// specific format.
    public var distribution: DataDownload?
    
    /// A data catalog which contains this dataset. Supersedes catalog,
    /// includedDataCatalog.
    /// - Inverse property: dataset.
    public var includedInDataCatalog: DataCatalog?
    
    /// The International Standard Serial Number (ISSN) that identifies this
    /// serial publication. You can repeat this property to identify different
    /// formats of, or the linking ISSN (ISSN-L) for, this serial publication.
    public var issn: String?
    
    /// A technique or technology used corresponding to the method used for measuring the corresponding variable(s).
    ///
    /// See _MeasurementTechnique_ for more information.
    public var measurementTechnique: MeasurementTechnique?
    
    /// The variableMeasured property can indicate (repeated as necessary) the variables
    /// that are measured in some dataset, either described as text or as pairs of identifier
    /// and description using PropertyValue.
    public var variableMeasured: PropertyValueOrText?
    
    internal enum DatasetCodingKeys: String, CodingKey {
        case distribution
        case includedInDataCatalog
        case issn
        case measurementTechnique
        case variableMeasured
    }
    
    public override init() {
        super.init()
    }
    
    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        
        let container = try decoder.container(keyedBy: DatasetCodingKeys.self)
        
        distribution = try container.decodeIfPresent(DataDownload.self, forKey: .distribution)
        includedInDataCatalog = try container.decodeIfPresent(DataCatalog.self, forKey: .includedInDataCatalog)
        issn = try container.decodeIfPresent(String.self, forKey: .issn)
        measurementTechnique = try container.decodeIfPresent(MeasurementTechnique.self, forKey: .measurementTechnique)
        variableMeasured = try container.decodeIfPresent(PropertyValueOrText.self, forKey: .variableMeasured)
    }
    
    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: DatasetCodingKeys.self)
        
        try container.encodeIfPresent(distribution, forKey: .distribution)
        try container.encodeIfPresent(includedInDataCatalog, forKey: .includedInDataCatalog)
        try container.encodeIfPresent(issn, forKey: .issn)
        try container.encodeIfPresent(measurementTechnique, forKey: .measurementTechnique)
        try container.encodeIfPresent(variableMeasured, forKey: .variableMeasured)
        
        try super.encode(to: encoder)
    }
}
