import XCTest
@testable import DesignSystem

/// `DSSpacing` 토큰 값의 리그레션을 검증합니다.
final class DSSpacingTests: XCTestCase {

    func test_none_equals0() {
        // given / when - static constant
        // then
        XCTAssertEqual(DSSpacing.none, 0)
    }

    func test_xs_equals4() {
        // given / when
        // then
        XCTAssertEqual(DSSpacing.xs, 4)
    }

    func test_sm_equals8() {
        // given / when
        // then
        XCTAssertEqual(DSSpacing.sm, 8)
    }

    func test_md_equals16() {
        // given / when
        // then
        XCTAssertEqual(DSSpacing.md, 16)
    }

    func test_lg_equals24() {
        // given / when
        // then
        XCTAssertEqual(DSSpacing.lg, 24)
    }

    func test_xl_equals32() {
        // given / when
        // then
        XCTAssertEqual(DSSpacing.xl, 32)
    }

    func test_xxl_equals48() {
        // given / when
        // then
        XCTAssertEqual(DSSpacing.xxl, 48)
    }

    func test_spacingScale_isStrictlyAscending() {
        // given
        let values: [CGFloat] = [
            DSSpacing.none,
            DSSpacing.xs,
            DSSpacing.sm,
            DSSpacing.md,
            DSSpacing.lg,
            DSSpacing.xl,
            DSSpacing.xxl
        ]

        // when / then
        for index in values.indices.dropFirst() {
            XCTAssertGreaterThan(
                values[index],
                values[index - 1],
                "spacing 토큰이 오름차순이어야 합니다. index \(index) 확인 필요"
            )
        }
    }
}
