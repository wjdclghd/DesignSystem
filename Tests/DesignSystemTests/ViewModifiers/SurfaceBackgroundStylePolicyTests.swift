import XCTest
@testable import DesignSystem

/// `SurfaceBackgroundStylePolicy` 기본 정책을 검증합니다.
final class SurfaceBackgroundStylePolicyTests: XCTestCase {

    func test_defaultPolicy_usesSurfaceColorRole() {
        XCTAssertEqual(SurfaceBackgroundStylePolicy.default.colorRole, .surface)
    }

    func test_defaultPolicy_usesMediumCornerRadius() {
        XCTAssertEqual(SurfaceBackgroundStylePolicy.default.cornerRadius, DSCornerRadius.md)
    }
}
