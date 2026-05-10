import XCTest
@testable import DesignSystem

/// `DSTabBarStylePolicy` 기본 정책 값을 검증합니다.
final class DSTabBarStylePolicyTests: XCTestCase {
    func test_standard_usesLargeIconSize() {
        XCTAssertEqual(DSTabBarStylePolicy.standard.iconSize, DSIconSize.lg)
    }

    func test_standard_usesPrimarySelectedColor() {
        XCTAssertEqual(DSTabBarStylePolicy.standard.selectedColorRole, .primary)
    }

    func test_standard_usesDisabledUnselectedColor() {
        XCTAssertEqual(DSTabBarStylePolicy.standard.unselectedColorRole, .textDisabled)
    }
}
