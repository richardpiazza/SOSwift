import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(AccessibilityAPITests.allTests),
        testCase(AccessibilityControlTests.allTests),
        testCase(AccessibilityFeatureTests.allTests),
        testCase(AccessibilityHazardTests.allTests),
        testCase(AccessModeSufficientTests.allTests),
        testCase(ActionStatusTests.allTests),
        testCase(ActionTests.allTests),
        testCase(AggregateRatingTests.allTests),
        testCase(AlignmentObjectOrCourseOrTextTests.allTests),
        testCase(AreaServedTests.allTests),
        testCase(ArticleTests.allTests),
        testCase(AudienceTests.allTests),
        testCase(AudioObjectTests.allTests),
        testCase(BrandOrOrganizationTests.allTests),
        testCase(BroadcastServiceTests.allTests),
        testCase(BusinessEntityTypeTests.allTests),
        testCase(BusinessFunctionTests.allTests),
        testCase(CommentTests.allTests),
        testCase(ContactPointOptionTests.allTests),
    ]
}
#endif
