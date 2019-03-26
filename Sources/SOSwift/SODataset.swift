import Foundation
import SOSwiftVocabulary

/// A body of structured information describing some topic(s) of interest.
public class SODataset: SOCreativeWork, Dataset {
    
    public override class var type: String {
        return "Dataset"
    }
    
    public override class var dynamicSubtypes: [Dynamic.Type] {
        return [
            SODataFeed.self
        ]
    }
    
    /// A downloadable form of this dataset, at a specific location, in a specific format.
    public var distribution: DataDownload?
    /// A data catalog which contains this dataset. Supersedes catalog, includedDataCatalog.
    /// - Inverse property: dataset.
    public var includedInDataCatalog: DataCatalog?
    /// The International Standard Serial Number (ISSN) that identifies this serial publication. You can repeat this property to identify different formats of, or the linking ISSN (ISSN-L) for, this serial publication.
    public var issn: String?
    /// A technique or technology used in a Dataset (or DataDownload, DataCatalog), corresponding to the method used for measuring the corresponding variable(s) (described using variableMeasured). This is oriented towards scientific and scholarly dataset publication but may have broader applicability; it is not intended as a full representation of measurement, but rather as a high level summary for dataset discovery.
    /// For example, if variableMeasured is: molecule concentration, measurementTechnique could be: "mass spectrometry" or "nmr spectroscopy" or "colorimetry" or "immunofluorescence".
    /// If the variableMeasured is "depression rating", the measurementTechnique could be "Zung Scale" or "HAM-D" or "Beck Depression Inventory".
    /// If there are several variableMeasured properties recorded for some given data object, use a PropertyValue for each variableMeasured and attach the corresponding measurementTechnique.
    public var measurementTechnique: URLOrText?
    /// The variableMeasured property can indicate (repeated as necessary) the variables that are measured in some dataset, either described as text or as pairs of identifier and description using PropertyValue.
    public var variableMeasured: PropertyValueOrText?
    
    private enum CodingKeys: String, CodingKey {
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
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.distribution = try container.decodeIfPresent(SODataDownload.self, forKey: .distribution)
        self.includedInDataCatalog = try container.decodeIfPresent(SODataCatalog.self, forKey: .includedInDataCatalog)
        self.issn = try container.decodeIfPresent(String.self, forKey: .issn)
        self.measurementTechnique = try container.decodeURLOrTextIfPresent(forKey: .measurementTechnique)
        self.variableMeasured = try container.decodePropertyValueOrTextIfPresent(forKey: .variableMeasured)
        
        try super.init(from: decoder)
    }
    
    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encodeIfPresent(self.distribution, forKey: .distribution)
        try container.encodeIfPresent(self.includedInDataCatalog, forKey: .includedInDataCatalog)
        try container.encodeIfPresent(self.issn, forKey: .issn)
        try container.encodeIfPresent(self.measurementTechnique, forKey: .measurementTechnique)
        try container.encodeIfPresent(self.variableMeasured, forKey: .variableMeasured)
        
        try super.encode(to: encoder)
    }
    
    // MARK: - Attributed
    public override func displayDescription(forAttributeNamed attributeName: String) -> String? {
        switch attributeName {
        case CodingKeys.distribution.rawValue:
            return "A downloadable form of this dataset, at a specific location, in a specific format."
        case CodingKeys.includedInDataCatalog.rawValue:
            return "A data catalog which contains this dataset."
        case CodingKeys.issn.rawValue:
            return "The International Standard Serial Number that identifies this serial publication."
        case CodingKeys.measurementTechnique.rawValue:
            return "A technique or technology used in a Dataset."
        case CodingKeys.variableMeasured.rawValue:
            return "Indicates the variables that are measured in some dataset."
        default:
            return super.displayDescription(forAttributeNamed: attributeName)
        }
    }
    
    public override func setValue(_ value: Any?, forAttributeNamed attributeName: String) {
        switch attributeName {
        case CodingKeys.distribution.rawValue:
            self.distribution = value as? DataDownload
        case CodingKeys.includedInDataCatalog.rawValue:
            self.includedInDataCatalog = value as? DataCatalog
        case CodingKeys.issn.rawValue:
            self.issn = value as? String
        case CodingKeys.measurementTechnique.rawValue:
            self.measurementTechnique = value as? URLOrText
        case CodingKeys.variableMeasured.rawValue:
            self.variableMeasured = value as? PropertyValueOrText
        default:
            super.setValue(value, forAttributeNamed: attributeName)
        }
    }
}

public extension KeyedEncodingContainer {
    mutating func encodeIfPresent(_ value: Dataset?, forKey key: K) throws {
        if let typedValue = value as? SODataset {
            try self.encode(typedValue, forKey: key)
        }
    }
}
