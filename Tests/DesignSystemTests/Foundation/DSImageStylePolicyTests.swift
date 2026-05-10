import XCTest
@testable import DesignSystem

/// 이미지 표시 정책 값의 리그레션을 검증합니다.
final class DSImageStylePolicyTests: XCTestCase {

    func test_aspectRatioSquare_hasWidthDividedByHeightOne() {
        XCTAssertEqual(DSImageAspectRatio.square.widthDividedByHeight, 1)
        XCTAssertTrue(DSImageAspectRatio.square.isValid)
    }

    func test_aspectRatioRatio_usesWidthDividedByHeight() {
        let ratio = DSImageAspectRatio.ratio(4 / 3)

        XCTAssertEqual(ratio.widthDividedByHeight, 4 / 3)
        XCTAssertTrue(ratio.isValid)
    }

    func test_placeholderImage_usesSurfaceAndDisabledTokens() {
        let placeholder = DSImagePlaceholderPolicy.image

        XCTAssertEqual(placeholder.backgroundColorRole, .surface)
        XCTAssertEqual(placeholder.iconColorRole, .textDisabled)
        XCTAssertEqual(placeholder.iconName, "photo")
    }

    func test_fallbackImageLoadFailure_usesDesignSystemContract() {
        let fallback = DSImageFallbackPolicy.imageLoadFailure

        XCTAssertEqual(fallback.backgroundColorRole, .surface)
        XCTAssertEqual(fallback.iconColorRole, .textDisabled)
        XCTAssertEqual(fallback.iconName, "photo")
        XCTAssertEqual(fallback.accessibilityLabel, DSAccessibilityLabel.error)
    }

    func test_appIconListPolicy_usesListIconContract() {
        let policy = DSImageStylePolicy.appIconList

        XCTAssertEqual(policy.displaySize, .square(DSImageSize.appIconSm))
        XCTAssertEqual(policy.aspectRatio, .square)
        XCTAssertEqual(policy.contentMode, .fit)
        XCTAssertEqual(policy.cornerRadius, DSCornerRadius.sm)
        XCTAssertEqual(policy.placeholder, .image)
        XCTAssertEqual(policy.fallback, .imageLoadFailure)
        XCTAssertEqual(policy.minimumSourceScale, 2)
    }

    func test_appIconDetailPolicy_usesDetailIconContract() {
        let policy = DSImageStylePolicy.appIconDetail

        XCTAssertEqual(policy.displaySize, .square(DSImageSize.appIconLg))
        XCTAssertEqual(policy.aspectRatio, .square)
        XCTAssertEqual(policy.contentMode, .fit)
        XCTAssertEqual(policy.cornerRadius, DSCornerRadius.lg)
        XCTAssertEqual(policy.placeholder, .image)
        XCTAssertEqual(policy.fallback, .imageLoadFailure)
        XCTAssertEqual(policy.minimumSourceScale, 3)
    }

    func test_thumbnailPolicy_usesSquareFillContract() {
        let policy = DSImageStylePolicy.thumbnail

        XCTAssertEqual(policy.displaySize, .square(DSImageSize.thumbnail))
        XCTAssertEqual(policy.aspectRatio, .square)
        XCTAssertEqual(policy.contentMode, .fill)
        XCTAssertEqual(policy.cornerRadius, DSCornerRadius.sm)
        XCTAssertEqual(policy.minimumSourceScale, 2)
    }

    func test_profilePolicy_usesSquareFillPillContract() {
        let policy = DSImageStylePolicy.profile

        XCTAssertEqual(policy.displaySize, .square(DSImageSize.profile))
        XCTAssertEqual(policy.aspectRatio, .square)
        XCTAssertEqual(policy.contentMode, .fill)
        XCTAssertEqual(policy.cornerRadius, DSCornerRadius.pill)
        XCTAssertEqual(policy.minimumSourceScale, 2)
    }

    func test_cardPolicy_usesFourToThreeDisplaySize() {
        let policy = DSImageStylePolicy.card

        XCTAssertEqual(policy.displaySize, DSImageDisplaySize(width: DSImageSize.card, height: 90))
        XCTAssertEqual(policy.aspectRatio.widthDividedByHeight, 4 / 3)
        XCTAssertEqual(policy.contentMode, .fill)
        XCTAssertEqual(policy.cornerRadius, DSCornerRadius.md)
        XCTAssertEqual(policy.minimumSourceScale, 2)
    }

    func test_bannerPolicy_usesSixteenToNineDisplaySize() {
        let policy = DSImageStylePolicy.banner

        XCTAssertEqual(policy.displaySize, DSImageDisplaySize(width: DSImageSize.banner, height: 112.5))
        XCTAssertEqual(policy.aspectRatio.widthDividedByHeight, 16 / 9)
        XCTAssertEqual(policy.contentMode, .fill)
        XCTAssertEqual(policy.cornerRadius, DSCornerRadius.md)
        XCTAssertEqual(policy.minimumSourceScale, 3)
    }

    func test_defaultPolicies_havePositiveRatioAndMinimumSourceScale() {
        let policies = [
            DSImageStylePolicy.appIconList,
            DSImageStylePolicy.appIconDetail,
            DSImageStylePolicy.thumbnail,
            DSImageStylePolicy.profile,
            DSImageStylePolicy.card,
            DSImageStylePolicy.banner
        ]

        for policy in policies {
            XCTAssertTrue(policy.aspectRatio.isValid)
            XCTAssertGreaterThan(policy.minimumSourceScale, 0)
            XCTAssertGreaterThan(policy.displaySize.width, 0)
            XCTAssertGreaterThan(policy.displaySize.height, 0)
        }
    }
}
