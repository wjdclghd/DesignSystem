import XCTest
@testable import DesignSystem

/// `DSCornerRadius` 토큰 값의 리그레션을 검증합니다.
final class DSCornerRadiusTests: XCTestCase {

    func test_none_equals0() {
        // given / when
        // then
        XCTAssertEqual(DSCornerRadius.none, 0)
    }

    func test_xs_equals4() {
        // given / when
        // then
        XCTAssertEqual(DSCornerRadius.xs, 4)
    }

    func test_sm_equals8() {
        // given / when
        // then
        XCTAssertEqual(DSCornerRadius.sm, 8)
    }

    func test_md_equals12() {
        // given / when
        // then
        XCTAssertEqual(DSCornerRadius.md, 12)
    }

    func test_lg_equals16() {
        // given / when
        // then
        XCTAssertEqual(DSCornerRadius.lg, 16)
    }

    func test_xl_equals24() {
        // given / when
        // then
        XCTAssertEqual(DSCornerRadius.xl, 24)
    }

    func test_pill_equals999() {
        // given / when
        // then
        XCTAssertEqual(DSCornerRadius.pill, 999)
    }

    func test_cornerRadiusScale_isStrictlyAscending() {
        // given
        let values: [CGFloat] = [
            DSCornerRadius.none,
            DSCornerRadius.xs,
            DSCornerRadius.sm,
            DSCornerRadius.md,
            DSCornerRadius.lg,
            DSCornerRadius.xl,
            DSCornerRadius.pill
        ]

        // when / then
        for index in values.indices.dropFirst() {
            XCTAssertGreaterThan(
                values[index],
                values[index - 1],
                "cornerRadius 토큰이 오름차순이어야 합니다. index \(index) 확인 필요"
            )
        }
    }
}
