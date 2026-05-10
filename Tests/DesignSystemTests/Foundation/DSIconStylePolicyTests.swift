import XCTest
@testable import DesignSystem

/// `DSIconStylePolicy` 기본 정책 값을 검증합니다.
final class DSIconStylePolicyTests: XCTestCase {
    func test_tabBar_usesLargeIconAndSecondaryTextColor() {
        XCTAssertEqual(DSIconStylePolicy.tabBar.size, DSIconSize.lg)
        XCTAssertEqual(DSIconStylePolicy.tabBar.colorRole, .textSecondary)
    }

    func test_emptyState_usesExtraExtraLargeIconAndDisabledTextColor() {
        XCTAssertEqual(DSIconStylePolicy.emptyState.size, DSIconSize.xxl)
        XCTAssertEqual(DSIconStylePolicy.emptyState.colorRole, .textDisabled)
    }

    func test_errorState_usesExtraExtraLargeIconAndErrorColor() {
        XCTAssertEqual(DSIconStylePolicy.errorState.size, DSIconSize.xxl)
        XCTAssertEqual(DSIconStylePolicy.errorState.colorRole, .error)
    }
}
