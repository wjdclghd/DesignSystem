import XCTest
@testable import DesignSystem

/// `DSImageDisplaySize` 표시 크기 정책을 검증합니다.
final class DSImageDisplaySizeTests: XCTestCase {

    func test_init_setsWidthAndHeight() {
        // given / when
        let displaySize = DSImageDisplaySize(width: 120, height: 90)

        // then
        XCTAssertEqual(displaySize.width, 120)
        XCTAssertEqual(displaySize.height, 90)
    }

    func test_square_setsSameWidthAndHeight() {
        // given / when
        let displaySize = DSImageDisplaySize.square(DSImageSize.appIconSm)

        // then
        XCTAssertEqual(displaySize.width, DSImageSize.appIconSm)
        XCTAssertEqual(displaySize.height, DSImageSize.appIconSm)
    }
}
