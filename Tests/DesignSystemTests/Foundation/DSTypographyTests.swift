import XCTest
@testable import DesignSystem

/// `DSTypography` 정책 값이 디자인 시스템 계약을 유지하는지 검증합니다.
final class DSTypographyTests: XCTestCase {

    func test_displayPolicy_hasExpectedTextStyleWeightAndLineHeight() {
        let policy = DSTypography.displayPolicy

        XCTAssertEqual(policy.textStyle, .largeTitle)
        XCTAssertEqual(policy.weight, .bold)
        XCTAssertEqual(policy.lineHeight, 41)
    }

    func test_titlePolicies_haveExpectedTextStylesWeightsAndLineHeights() {
        XCTAssertEqual(DSTypography.title1Policy, .init(textStyle: .title, weight: .bold, lineHeight: 34))
        XCTAssertEqual(DSTypography.title2Policy, .init(textStyle: .title2, weight: .semibold, lineHeight: 28))
        XCTAssertEqual(DSTypography.title3Policy, .init(textStyle: .title3, weight: .semibold, lineHeight: 25))
    }

    func test_bodyPolicies_haveExpectedTextStylesWeightsAndLineHeights() {
        XCTAssertEqual(DSTypography.headlinePolicy, .init(textStyle: .headline, weight: .semibold, lineHeight: 22))
        XCTAssertEqual(DSTypography.body1Policy, .init(textStyle: .body, weight: .regular, lineHeight: 22))
        XCTAssertEqual(DSTypography.body2Policy, .init(textStyle: .callout, weight: .regular, lineHeight: 20))
    }

    func test_captionAndLabelPolicies_haveExpectedTextStylesWeightsAndLineHeights() {
        XCTAssertEqual(DSTypography.caption1Policy, .init(textStyle: .caption, weight: .regular, lineHeight: 16))
        XCTAssertEqual(DSTypography.caption2Policy, .init(textStyle: .caption2, weight: .regular, lineHeight: 13))
        XCTAssertEqual(DSTypography.labelPolicy, .init(textStyle: .footnote, weight: .medium, lineHeight: 18))
    }

    func test_allPolicies_containsEveryTypographyRole() {
        XCTAssertEqual(DSTypography.allPolicies.count, 10)
    }

    func test_allPolicies_havePositiveLineHeight() {
        for policy in DSTypography.allPolicies {
            XCTAssertGreaterThan(policy.lineHeight, 0)
        }
    }
}
