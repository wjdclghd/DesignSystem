import XCTest
@testable import DesignSystem

/// `DSImageSize` 토큰 값의 리그레션을 검증합니다.
final class DSImageSizeTests: XCTestCase {

    func test_appIconSm_equals40() {
        // given / when
        // then
        XCTAssertEqual(DSImageSize.appIconSm, 40)
    }

    func test_appIconMd_equals60() {
        // given / when
        // then
        XCTAssertEqual(DSImageSize.appIconMd, 60)
    }

    func test_appIconLg_equals80() {
        // given / when
        // then
        XCTAssertEqual(DSImageSize.appIconLg, 80)
    }

    func test_thumbnail_equals56() {
        // given / when
        // then
        XCTAssertEqual(DSImageSize.thumbnail, 56)
    }

    func test_profile_equals48() {
        // given / when
        // then
        XCTAssertEqual(DSImageSize.profile, 48)
    }

    func test_card_equals120() {
        // given / when
        // then
        XCTAssertEqual(DSImageSize.card, 120)
    }

    func test_banner_equals200() {
        // given / when
        // then
        XCTAssertEqual(DSImageSize.banner, 200)
    }

    func test_appIconScale_isStrictlyAscending() {
        // given
        let appIconSizes: [CGFloat] = [
            DSImageSize.appIconSm,
            DSImageSize.appIconMd,
            DSImageSize.appIconLg
        ]

        // when / then
        for index in appIconSizes.indices.dropFirst() {
            XCTAssertGreaterThan(
                appIconSizes[index],
                appIconSizes[index - 1],
                "appIcon 크기가 오름차순이어야 합니다. index \(index) 확인 필요"
            )
        }
    }
}
