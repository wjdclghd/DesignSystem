import CoreGraphics

/// 이미지 표시 영역의 pt 단위 크기 정책입니다.
///
/// UIComponents는 이 값을 View의 표시 크기로 사용하고, ImagePipeline은 device scale을 곱해 필요한 pixel 크기를 계산합니다.
public struct DSImageDisplaySize: Equatable, Sendable {
    public let width: CGFloat
    public let height: CGFloat

    /// 이미지 표시 영역 크기를 생성합니다.
    ///
    /// - Parameters:
    ///   - width: pt 단위 표시 너비입니다.
    ///   - height: pt 단위 표시 높이입니다.
    public init(width: CGFloat, height: CGFloat) {
        precondition(width > 0, "DSImageDisplaySize.width는 0보다 커야 합니다.")
        precondition(height > 0, "DSImageDisplaySize.height는 0보다 커야 합니다.")

        self.width = width
        self.height = height
    }

    /// 정사각형 표시 영역 크기를 생성합니다.
    ///
    /// - Parameter length: pt 단위 한 변의 길이입니다.
    /// - Returns: 너비와 높이가 같은 표시 영역 크기입니다.
    public static func square(_ length: CGFloat) -> DSImageDisplaySize {
        DSImageDisplaySize(width: length, height: length)
    }
}
