import Foundation

/// A collection of datasets.
public class DataCatalog: CreativeWork {
    
    /// A dataset contained in this catalog.
    /// - Inverse property: includedInDataCatalog.
    public var dataset: Dataset?
    
    /// A technique or technology used corresponding to the method used for measuring the corresponding variable(s).
    ///
    /// See _MeasurementTechnique_ for more information.
    public var measurementTechnique: MeasurementTechnique?
    
    internal enum DataCatalogCodingKeys: String, CodingKey {
        case dataset
        case measurementTechnique
    }
    
    public override init() {
        super.init()
    }
    
    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        
        let container = try decoder.container(keyedBy: DataCatalogCodingKeys.self)
        
        
    }
    
    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: DataCatalogCodingKeys.self)
        
        
        
        try super.encode(to: encoder)
    }
}
