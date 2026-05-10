import XCTest
@testable import DesignSystem

/// `DSBackButtonStylePolicy` 기본 정책 값을 검증합니다.
final class DSBackButtonStylePolicyTests: XCTestCase {

    func test_navigationBar_usesMinimumTapTargetSize() {
        XCTAssertEqual(DSBackButtonStylePolicy.navigationBar.tapTargetSize, 44)
    }

    func test_navigationBar_usesAssetNativeIconFrameSize() {
        XCTAssertEqual(DSBackButtonStylePolicy.navigationBar.iconFrameSize, 44)
    }

    func test_navigationBar_usesTextPrimaryIconColorRole() {
        XCTAssertEqual(DSBackButtonStylePolicy.navigationBar.iconColorRole, .textPrimary)
    }
}
