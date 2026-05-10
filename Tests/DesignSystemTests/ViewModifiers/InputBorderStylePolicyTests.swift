import XCTest
@testable import DesignSystem

/// `InputBorderStylePolicy` 기본 정책을 검증합니다.
final class InputBorderStylePolicyTests: XCTestCase {

    func test_defaultPolicy_usesOutlineColorRole() {
        XCTAssertEqual(InputBorderStylePolicy.default.colorRole, .outline)
    }

    func test_defaultPolicy_usesSmallCornerRadius() {
        XCTAssertEqual(InputBorderStylePolicy.default.cornerRadius, DSCornerRadius.sm)
    }

    func test_defaultPolicy_usesOnePointLineWidth() {
        XCTAssertEqual(InputBorderStylePolicy.default.lineWidth, 1)
    }
}
