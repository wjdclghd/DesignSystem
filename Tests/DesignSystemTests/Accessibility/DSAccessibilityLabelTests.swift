import XCTest
@testable import DesignSystem

/// `DSAccessibilityLabel` 상수 값의 리그레션을 검증합니다.
final class DSAccessibilityLabelTests: XCTestCase {

    // MARK: - Navigation

    func test_back_isCorrectLabel() {
        XCTAssertEqual(DSAccessibilityLabel.back, "뒤로")
    }

    func test_forward_isCorrectLabel() {
        XCTAssertEqual(DSAccessibilityLabel.forward, "앞으로")
    }

    func test_close_isCorrectLabel() {
        XCTAssertEqual(DSAccessibilityLabel.close, "닫기")
    }

    func test_dismiss_isCorrectLabel() {
        XCTAssertEqual(DSAccessibilityLabel.dismiss, "내리기")
    }

    // MARK: - Action

    func test_confirm_isCorrectLabel() {
        XCTAssertEqual(DSAccessibilityLabel.confirm, "확인")
    }

    func test_cancel_isCorrectLabel() {
        XCTAssertEqual(DSAccessibilityLabel.cancel, "취소")
    }

    func test_search_isCorrectLabel() {
        XCTAssertEqual(DSAccessibilityLabel.search, "검색")
    }

    func test_menu_isCorrectLabel() {
        XCTAssertEqual(DSAccessibilityLabel.menu, "메뉴")
    }

    func test_more_isCorrectLabel() {
        XCTAssertEqual(DSAccessibilityLabel.more, "더 보기")
    }

    func test_refresh_isCorrectLabel() {
        XCTAssertEqual(DSAccessibilityLabel.refresh, "새로 고침")
    }

    // MARK: - State

    func test_loading_isCorrectLabel() {
        XCTAssertEqual(DSAccessibilityLabel.loading, "불러오는 중")
    }

    func test_empty_isCorrectLabel() {
        XCTAssertEqual(DSAccessibilityLabel.empty, "내용 없음")
    }

    func test_error_isCorrectLabel() {
        XCTAssertEqual(DSAccessibilityLabel.error, "오류")
    }

    func test_allLabels_areNonEmpty() {
        // given
        let labels = [
            DSAccessibilityLabel.back,
            DSAccessibilityLabel.forward,
            DSAccessibilityLabel.close,
            DSAccessibilityLabel.dismiss,
            DSAccessibilityLabel.confirm,
            DSAccessibilityLabel.cancel,
            DSAccessibilityLabel.search,
            DSAccessibilityLabel.menu,
            DSAccessibilityLabel.more,
            DSAccessibilityLabel.refresh,
            DSAccessibilityLabel.loading,
            DSAccessibilityLabel.empty,
            DSAccessibilityLabel.error
        ]

        // when / then
        for label in labels {
            XCTAssertFalse(label.isEmpty, "레이블이 빈 문자열이면 안 됩니다: \(label)")
        }
    }
}
