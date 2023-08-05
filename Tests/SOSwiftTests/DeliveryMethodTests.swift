import XCTest
@testable import SOSwift

class DeliveryMethodTests: XCTestCase {
    
    func testCaseIterable() throws {
        XCTAssertEqual(DeliveryMethod.allCases.count, 8)
    }
    
    func testDisplayValue() throws {
        XCTAssertEqual(DeliveryMethod.directDownload.displayValue, "Direct Download")
        XCTAssertEqual(DeliveryMethod.frieght.displayValue, "Frieght")
        XCTAssertEqual(DeliveryMethod.mail.displayValue, "Postal")
        XCTAssertEqual(DeliveryMethod.ownFleet.displayValue, "Own Fleet")
        XCTAssertEqual(DeliveryMethod.pickUp.displayValue, "Pick Up")
        XCTAssertEqual(DeliveryMethod.dhl.displayValue, "DHL")
        XCTAssertEqual(DeliveryMethod.federalExpress.displayValue, "FedEX")
        XCTAssertEqual(DeliveryMethod.ups.displayValue, "UPS")
    }
    
}
