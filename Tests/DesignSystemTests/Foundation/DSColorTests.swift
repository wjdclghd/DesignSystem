import XCTest
@testable import DesignSystem

/// `DSColor` 시멘틱 역할과 asset name 매핑을 검증합니다.
final class DSColorTests: XCTestCase {

    func test_colorRoles_coverDesignSystemSemanticColors() {
        XCTAssertEqual(DSColorRole.allCases.count, 14)
    }

    func test_primaryRoles_haveExpectedAssetNames() {
        XCTAssertEqual(DSColor.assetName(for: .primary), "color_primary")
        XCTAssertEqual(DSColor.assetName(for: .onPrimary), "color_on_primary")
    }

    func test_secondaryRoles_haveExpectedAssetNames() {
        XCTAssertEqual(DSColor.assetName(for: .secondary), "color_secondary")
        XCTAssertEqual(DSColor.assetName(for: .onSecondary), "color_on_secondary")
    }

    func test_backgroundAndSurfaceRoles_haveExpectedAssetNames() {
        XCTAssertEqual(DSColor.assetName(for: .background), "color_background")
        XCTAssertEqual(DSColor.assetName(for: .onBackground), "color_on_background")
        XCTAssertEqual(DSColor.assetName(for: .surface), "color_surface")
        XCTAssertEqual(DSColor.assetName(for: .onSurface), "color_on_surface")
    }

    func test_outlineAndErrorRoles_haveExpectedAssetNames() {
        XCTAssertEqual(DSColor.assetName(for: .outline), "color_outline")
        XCTAssertEqual(DSColor.assetName(for: .error), "color_error")
        XCTAssertEqual(DSColor.assetName(for: .onError), "color_on_error")
    }

    func test_textRoles_haveExpectedAssetNames() {
        XCTAssertEqual(DSColor.assetName(for: .textPrimary), "color_text_primary")
        XCTAssertEqual(DSColor.assetName(for: .textSecondary), "color_text_secondary")
        XCTAssertEqual(DSColor.assetName(for: .textDisabled), "color_text_disabled")
    }

    func test_colorAssetNames_areUniqueAndUseColorPrefix() {
        let assetNames = DSColorRole.allCases.map(DSColor.assetName(for:))

        XCTAssertEqual(Set(assetNames).count, assetNames.count)
        XCTAssertTrue(assetNames.allSatisfy { $0.hasPrefix("color_") })
    }
}
