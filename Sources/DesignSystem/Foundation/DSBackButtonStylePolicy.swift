import CoreGraphics

/// 뒤로가기 버튼의 표시 크기와 터치 영역 정책입니다.
public struct DSBackButtonStylePolicy: Equatable, Sendable {
    public let tapTargetSize: CGFloat
    public let iconFrameSize: CGFloat
    public let iconColorRole: DSColorRole

    /// 뒤로가기 버튼 스타일 정책을 생성합니다.
    ///
    /// - Parameters:
    ///   - tapTargetSize: 터치 가능한 영역의 한 변 크기입니다.
    ///   - iconFrameSize: 아이콘을 그릴 프레임의 한 변 크기입니다.
    ///   - iconColorRole: 아이콘 색상 역할입니다.
    public init(
        tapTargetSize: CGFloat,
        iconFrameSize: CGFloat,
        iconColorRole: DSColorRole
    ) {
        precondition(tapTargetSize > 0, "tapTargetSize는 0보다 커야 합니다.")
        precondition(iconFrameSize > 0, "iconFrameSize는 0보다 커야 합니다.")

        self.tapTargetSize = tapTargetSize
        self.iconFrameSize = iconFrameSize
        self.iconColorRole = iconColorRole
    }
}

public extension DSBackButtonStylePolicy {
    /// NavigationBar에서 사용하는 기본 뒤로가기 버튼 정책입니다.
    static let navigationBar = DSBackButtonStylePolicy(
        tapTargetSize: 44,
        iconFrameSize: 44,
        iconColorRole: .textPrimary
    )
}
