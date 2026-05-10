import XCTest
@testable import DesignSystem

/// `CardShadowStylePolicy` 기본 정책을 검증합니다.
final class CardShadowStylePolicyTests: XCTestCase {

    func test_defaultPolicy_usesMediumCornerRadius() {
        XCTAssertEqual(CardShadowStylePolicy.default.cornerRadius, DSCornerRadius.md)
    }

    func test_defaultPolicy_usesLowShadowValues() {
        let shadow = CardShadowStylePolicy.default.shadow

        XCTAssertEqual(shadow.opacity, DSShadow.low.opacity)
        XCTAssertEqual(shadow.radius, DSShadow.low.radius)
        XCTAssertEqual(shadow.x, DSShadow.low.x)
        XCTAssertEqual(shadow.y, DSShadow.low.y)
    }
}
