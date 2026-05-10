import XCTest
@testable import DesignSystem

/// `DSShadow` 토큰 값의 리그레션을 검증합니다.
final class DSShadowTests: XCTestCase {

    func test_none_hasZeroOpacity() {
        // given / when
        // then
        XCTAssertEqual(DSShadow.none.opacity, 0.0)
    }

    func test_none_hasZeroRadius() {
        // given / when
        // then
        XCTAssertEqual(DSShadow.none.radius, 0)
    }

    func test_low_hasExpectedValues() {
        // given / when
        let style = DSShadow.low

        // then
        XCTAssertEqual(style.opacity, 0.08)
        XCTAssertEqual(style.radius, 4)
        XCTAssertEqual(style.x, 0)
        XCTAssertEqual(style.y, 2)
    }

    func test_medium_hasExpectedValues() {
        // given / when
        let style = DSShadow.medium

        // then
        XCTAssertEqual(style.opacity, 0.12)
        XCTAssertEqual(style.radius, 8)
        XCTAssertEqual(style.x, 0)
        XCTAssertEqual(style.y, 4)
    }

    func test_high_hasExpectedValues() {
        // given / when
        let style = DSShadow.high

        // then
        XCTAssertEqual(style.opacity, 0.16)
        XCTAssertEqual(style.radius, 16)
        XCTAssertEqual(style.x, 0)
        XCTAssertEqual(style.y, 8)
    }

    func test_shadowOpacity_isStrictlyAscending() {
        // given
        let opacities = [
            DSShadow.none.opacity,
            DSShadow.low.opacity,
            DSShadow.medium.opacity,
            DSShadow.high.opacity
        ]

        // when / then
        for index in opacities.indices.dropFirst() {
            XCTAssertGreaterThan(
                opacities[index],
                opacities[index - 1],
                "shadow opacity가 오름차순이어야 합니다. index \(index) 확인 필요"
            )
        }
    }

    func test_shadowRadius_isStrictlyAscending() {
        // given
        let radii: [CGFloat] = [
            DSShadow.none.radius,
            DSShadow.low.radius,
            DSShadow.medium.radius,
            DSShadow.high.radius
        ]

        // when / then
        for index in radii.indices.dropFirst() {
            XCTAssertGreaterThan(
                radii[index],
                radii[index - 1],
                "shadow radius가 오름차순이어야 합니다. index \(index) 확인 필요"
            )
        }
    }
}
