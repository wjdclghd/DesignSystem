import XCTest
@testable import DesignSystem

/// `DSIconSize` 토큰 값의 리그레션을 검증합니다.
final class DSIconSizeTests: XCTestCase {

    func test_xs_equals12() {
        // given / when
        // then
        XCTAssertEqual(DSIconSize.xs, 12)
    }

    func test_sm_equals16() {
        // given / when
        // then
        XCTAssertEqual(DSIconSize.sm, 16)
    }

    func test_md_equals20() {
        // given / when
        // then
        XCTAssertEqual(DSIconSize.md, 20)
    }

    func test_lg_equals24() {
        // given / when
        // then
        XCTAssertEqual(DSIconSize.lg, 24)
    }

    func test_xl_equals32() {
        // given / when
        // then
        XCTAssertEqual(DSIconSize.xl, 32)
    }

    func test_xxl_equals40() {
        // given / when
        // then
        XCTAssertEqual(DSIconSize.xxl, 40)
    }

    func test_iconSizeScale_isStrictlyAscending() {
        // given
        let values: [CGFloat] = [
            DSIconSize.xs,
            DSIconSize.sm,
            DSIconSize.md,
            DSIconSize.lg,
            DSIconSize.xl,
            DSIconSize.xxl
        ]

        // when / then
        for index in values.indices.dropFirst() {
            XCTAssertGreaterThan(
                values[index],
                values[index - 1],
                "iconSize 토큰이 오름차순이어야 합니다. index \(index) 확인 필요"
            )
        }
    }
}
