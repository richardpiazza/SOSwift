import Foundation
import SOSwiftVocabulary

/// A collection of datasets.
public class SODataCatalog: SOCreativeWork, DataCatalog {
    
    public override class var type: String {
        return "DataCatalog"
    }
    
    public override class var explicitSubtypes: [Thing.Type] {
        return []
    }
    
    /// A dataset contained in this catalog.
    /// - Inverse property: includedInDataCatalog.
    public var dataset: Dataset?
    /// A technique or technology used in a Dataset (or DataDownload, DataCatalog), corresponding to the method used for measuring the corresponding variable(s) (described using variableMeasured). This is oriented towards scientific and scholarly dataset publication but may have broader applicability; it is not intended as a full representation of measurement, but rather as a high level summary for dataset discovery.
    /// For example, if variableMeasured is: molecule concentration, measurementTechnique could be: "mass spectrometry" or "nmr spectroscopy" or "colorimetry" or "immunofluorescence".
    /// If the variableMeasured is "depression rating", the measurementTechnique could be "Zung Scale" or "HAM-D" or "Beck Depression Inventory".
    /// If there are several variableMeasured properties recorded for some given data object, use a PropertyValue for each variableMeasured and attach the corresponding measurementTechnique.
    public var measurementTechnique: URLOrText?
    
    private enum CodingKeys: String, CodingKey {
        case dataset
        case measurementTechnique
    }
    
    public override init() {
        super.init()
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.dataset = try container.decodeIfPresent(SODataset.self, forKey: .dataset)
        self.measurementTechnique = try container.decodeURLOrTextIfPresent(forKey: .measurementTechnique)
        
        try super.init(from: decoder)
    }
    
    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encodeIfPresent(self.dataset, forKey: .dataset)
        try container.encodeIfPresent(self.measurementTechnique, forKey: .measurementTechnique)
        
        try super.encode(to: encoder)
    }
}

public extension KeyedEncodingContainer {
    public mutating func encodeIfPresent(_ value: DataCatalog?, forKey key: K) throws {
        if let typedValue = value as? SODataCatalog {
            try self.encode(typedValue, forKey: key)
        }
    }
}
