import Foundation

public class DataDownload: MediaObject {

    /// A technique or technology used corresponding to the method used for measuring the corresponding variable(s).
    ///
    /// See _MeasurementTechnique_ for more information.
    public var measurementTechnique: MeasurementTechnique?

    enum DataDownloadCodingKeys: String, CodingKey {
        case measurementTechnique
    }

    override public init() {
        super.init()
    }

    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)

        let container = try decoder.container(keyedBy: DataDownloadCodingKeys.self)

        measurementTechnique = try container.decodeIfPresent(MeasurementTechnique.self, forKey: .measurementTechnique)
    }

    override public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: DataDownloadCodingKeys.self)

        try container.encodeIfPresent(measurementTechnique, forKey: .measurementTechnique)

        try super.encode(to: encoder)
    }
}
