import Foundation

public enum SchemaType: String, CaseIterable {
    case action = "Action"
    case administrativeArea = "AdministrativeArea"
    case alignmentObject = "AlignmentObject"
    case answer = "Answer"
    case article = "Article"
    case audience = "Audience"
    case audioObject = "AudioObject"
    case brand = "Brand"
    case broadcastService = "BroadcastService"
    case comment = "Comment"
    case contactPoint = "ContactPoint"
    case country = "Country"
    case course = "Course"
    case courseInstance = "CourseInstance"
    case creativeWork = "CreativeWork"
    case dataCatalog = "DataCatalog"
    case dataDownload = "DataDownload"
    case dataFeed = "DataFeed"
    case dataFeedItem = "DataFeedItem"
    case dataset = "Dataset"
    case demand = "Demand"
    case distance = "Distance"
    case educationalOrganization = "EducationalOrganization"
    case entryPoint = "EntryPoint"
    case enumeration = "Enumeration"
    case event = "Event"
    case financialProduct = "FinancialProduct"
    case geoCoordinates = "GeoCoordinates"
    case geoShape = "GeoShape"
    case imageObject = "ImageObject"
    case intangible = "Intangible"
    case interactionCounter = "InteractionCounter"
    case itemList = "ItemList"
    case language = "Language"
    case listItem = "ListItem"
    case loanOrCredit = "LoanOrCredit"
    case locationFeatureSpecification = "LocationFeatureSpecification"
    case map = "Map"
    case mediaObject = "MediaObject"
    case monetaryAmount = "MonetaryAmount"
    case musicAlbum = "MusicAlbum"
    case musicComposition = "MusicComposition"
    case musicGroup = "MusicGroup"
    case musicPlaylist = "MusicPlaylist"
    case musicRecording = "MusicRecording"
    case musicRelease = "MusicRelease"
    case newsArticle = "NewsArticle"
    case occupation = "Occupation"
    case offer = "Offer"
    case offerCatalog = "OfferCatalog"
    case openingHoursSpecification = "OpeningHoursSpecification"
    case organization = "Organization"
    case ownershipInfo = "OwnershipInfo"
    case performingGroup = "PerformingGroup"
    case person = "Person"
    case photograph = "Photograph"
    case place = "Place"
    case postalAddress = "PostalAddress"
    case priceSpecification = "PriceSpecification"
    case product = "Product"
    case productModel = "ProductModel"
    case programMembership = "ProgramMembership"
    case propertyValue = "PropertyValue"
    case publicationEvent = "PublicationEvent"
    case qualitativeValue = "QualitativeValue"
    case quantitativeValue = "QuantitativeValue"
    case quantity = "Quantity"
    case question = "Question"
    case rating = "Rating"
    case repaymentSpecification = "RepaymentSpecification"
    case review = "Review"
    case service = "Service"
    case serviceChannel = "ServiceChannel"
    case softwareApplication = "SoftwareApplication"
    case structuredValue = "StructuredValue"
    case thing = "Thing"
    case typeAndQuantityNode = "TypeAndQuantityNode"
    case videoObject = "VideoObject"
    case warrantyPromise = "WarrantyPromise"
    case website = "Website"

    public var type: SchemaCodable.Type {
        switch self {
        case .action: Action.self
        case .administrativeArea: AdministrativeArea.self
        case .alignmentObject: AlignmentObject.self
        case .answer: Answer.self
        case .article: Article.self
        case .audience: Audience.self
        case .audioObject: AudioObject.self
        case .brand: Brand.self
        case .broadcastService: BroadcastService.self
        case .comment: Comment.self
        case .contactPoint: ContactPoint.self
        case .country: Country.self
        case .course: Course.self
        case .courseInstance: CourseInstance.self
        case .creativeWork: CreativeWork.self
        case .dataCatalog: DataCatalog.self
        case .dataDownload: DataDownload.self
        case .dataFeed: DataFeed.self
        case .dataFeedItem: DataFeedItem.self
        case .dataset: Dataset.self
        case .demand: Demand.self
        case .distance: Distance.self
        case .educationalOrganization: EducationalOrganization.self
        case .entryPoint: EntryPoint.self
        case .enumeration: Enumeration.self
        case .event: Event.self
        case .financialProduct: FinancialProduct.self
        case .geoCoordinates: GeoCoordinates.self
        case .geoShape: GeoShape.self
        case .imageObject: ImageObject.self
        case .intangible: Intangible.self
        case .interactionCounter: InteractionCounter.self
        case .itemList: ItemList.self
        case .language: Language.self
        case .listItem: ListItem.self
        case .loanOrCredit: LoanOrCredit.self
        case .locationFeatureSpecification: LocationFeatureSpecification.self
        case .map: Map.self
        case .mediaObject: MediaObject.self
        case .monetaryAmount: MonetaryAmount.self
        case .musicAlbum: MusicAlbum.self
        case .musicComposition: MusicComposition.self
        case .musicGroup: MusicGroup.self
        case .musicPlaylist: MusicPlaylist.self
        case .musicRecording: MusicRecording.self
        case .musicRelease: MusicRelease.self
        case .newsArticle: NewsArticle.self
        case .occupation: Occupation.self
        case .offer: Offer.self
        case .offerCatalog: OfferCatalog.self
        case .openingHoursSpecification: OpeningHoursSpecification.self
        case .organization: Organization.self
        case .ownershipInfo: OwnershipInfo.self
        case .performingGroup: PerformingGroup.self
        case .person: Person.self
        case .photograph: Photograph.self
        case .place: Place.self
        case .postalAddress: PostalAddress.self
        case .priceSpecification: PriceSpecification.self
        case .product: Product.self
        case .productModel: ProductModel.self
        case .programMembership: ProgramMembership.self
        case .propertyValue: PropertyValue.self
        case .publicationEvent: PublicationEvent.self
        case .qualitativeValue: QualitativeValue.self
        case .quantitativeValue: QuantitativeValue.self
        case .quantity: Quantity.self
        case .question: Question.self
        case .rating: Rating.self
        case .repaymentSpecification: RepaymentSpecification.self
        case .review: Review.self
        case .service: Service.self
        case .serviceChannel: ServiceChannel.self
        case .softwareApplication: SoftwareApplication.self
        case .structuredValue: StructuredValue.self
        case .thing: Thing.self
        case .typeAndQuantityNode: TypeAndQuantityNode.self
        case .videoObject: VideoObject.self
        case .warrantyPromise: WarrantyPromise.self
        case .website: Website.self
        }
    }
}
