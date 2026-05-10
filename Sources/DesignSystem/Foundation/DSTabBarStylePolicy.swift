import CoreGraphics

/// 탭바 아이콘 크기와 선택 상태 색상 정책입니다.
public struct DSTabBarStylePolicy: Equatable, Sendable {
    public let iconSize: CGFloat
    public let selectedColorRole: DSColorRole
    public let unselectedColorRole: DSColorRole

    /// 탭바 스타일 정책을 생성합니다.
    ///
    /// - Parameters:
    ///   - iconSize: 탭바 아이콘을 그릴 프레임의 한 변 크기입니다.
    ///   - selectedColorRole: 선택된 탭의 색상 역할입니다.
    ///   - unselectedColorRole: 선택되지 않은 탭의 색상 역할입니다.
    public init(
        iconSize: CGFloat,
        selectedColorRole: DSColorRole,
        unselectedColorRole: DSColorRole
    ) {
        precondition(iconSize > 0, "iconSize는 0보다 커야 합니다.")

        self.iconSize = iconSize
        self.selectedColorRole = selectedColorRole
        self.unselectedColorRole = unselectedColorRole
    }
}

public extension DSTabBarStylePolicy {
    /// 앱 기본 탭바 정책입니다.
    static let standard = DSTabBarStylePolicy(
        iconSize: DSIconSize.lg,
        selectedColorRole: .primary,
        unselectedColorRole: .textDisabled
    )
}
