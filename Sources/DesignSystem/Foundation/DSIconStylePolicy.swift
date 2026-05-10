import CoreGraphics

/// 일반 아이콘의 표시 크기와 색상 정책입니다.
public struct DSIconStylePolicy: Equatable, Sendable {
    public let size: CGFloat
    public let colorRole: DSColorRole

    /// 아이콘 스타일 정책을 생성합니다.
    ///
    /// - Parameters:
    ///   - size: 아이콘을 그릴 프레임의 한 변 크기입니다.
    ///   - colorRole: 아이콘 색상 역할입니다.
    public init(
        size: CGFloat,
        colorRole: DSColorRole
    ) {
        precondition(size > 0, "size는 0보다 커야 합니다.")

        self.size = size
        self.colorRole = colorRole
    }
}

public extension DSIconStylePolicy {
    /// 탭바에서 사용하는 기본 아이콘 정책입니다.
    static let tabBar = DSIconStylePolicy(
        size: DSIconSize.lg,
        colorRole: .textSecondary
    )

    /// 빈 상태 화면에서 사용하는 기본 아이콘 정책입니다.
    static let emptyState = DSIconStylePolicy(
        size: DSIconSize.xxl,
        colorRole: .textDisabled
    )

    /// 에러 상태 화면에서 사용하는 기본 아이콘 정책입니다.
    static let errorState = DSIconStylePolicy(
        size: DSIconSize.xxl,
        colorRole: .error
    )
}
