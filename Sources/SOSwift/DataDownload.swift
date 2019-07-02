import Foundation

public class DataDownload: MediaObject {
    
    /// A technique or technology used in a Dataset (or DataDownload, DataCatalog),
    /// corresponding to the method used for measuring the corresponding variable(s)
    /// (described using variableMeasured). This is oriented towards scientific and scholarly
    /// dataset publication but may have broader applicability; it is not intended as a full
    /// representation of measurement, but rather as a high level summary for dataset discovery.
    ///
    /// For example:
    /// * if variableMeasured is: molecule concentration, measurementTechnique could be:
    ///     "mass spectrometry" or "nmr spectroscopy" or "colorimetry" or "immunofluorescence".
    /// * If the variableMeasured is "depression rating", the measurementTechnique could be
    ///     "Zung Scale" or "HAM-D" or "Beck Depression Inventory".
    /// * If there are several variableMeasured properties recorded for some given data object,
    ///     use a PropertyValue for each variableMeasured and attach the corresponding
    ///     measurementTechnique.
    public var measurementTechnique: URLOrText?
    
    internal enum DataDownloadCodingKeys: String, CodingKey {
        case measurementTechnique
    }
    
    public override init() {
        super.init()
    }
    
    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        
        let container = try decoder.container(keyedBy: DataDownloadCodingKeys.self)
        
        
    }
    
    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: DataDownloadCodingKeys.self)
        
        
        
        try super.encode(to: encoder)
    }
}
