import CoreGraphics

/// 이미지 표시 영역의 가로/세로 비율 정책입니다.
public enum DSImageAspectRatio: Equatable, Sendable {
    case square
    case ratio(CGFloat)

    /// `width / height` 기준 비율 값입니다.
    public var widthDividedByHeight: CGFloat {
        switch self {
        case .square:
            return 1
        case .ratio(let value):
            return value
        }
    }

    /// 정책 값이 유효한 양수 비율인지 나타냅니다.
    public var isValid: Bool {
        widthDividedByHeight > 0
    }
}

/// 이미지가 표시 영역에 맞춰지는 방식입니다.
public enum DSImageContentMode: Equatable, Sendable {
    case fit
    case fill
}

/// 이미지 로딩 중 표시할 placeholder 스타일 정책입니다.
public struct DSImagePlaceholderPolicy: Equatable, Sendable {
    public let backgroundColorRole: DSColorRole
    public let iconColorRole: DSColorRole
    public let iconName: String?

    /// placeholder 스타일 정책을 생성합니다.
    ///
    /// - Parameters:
    ///   - backgroundColorRole: placeholder 배경 색상 역할입니다.
    ///   - iconColorRole: placeholder 아이콘 색상 역할입니다.
    ///   - iconName: placeholder에 사용할 system image 이름입니다.
    public init(
        backgroundColorRole: DSColorRole,
        iconColorRole: DSColorRole,
        iconName: String?
    ) {
        self.backgroundColorRole = backgroundColorRole
        self.iconColorRole = iconColorRole
        self.iconName = iconName
    }

    /// 일반 이미지 로딩 영역에서 사용하는 기본 placeholder 정책입니다.
    public static let image = DSImagePlaceholderPolicy(
        backgroundColorRole: .surface,
        iconColorRole: .textDisabled,
        iconName: "photo"
    )
}

/// 이미지 로딩 실패 시 표시할 fallback 스타일 정책입니다.
public struct DSImageFallbackPolicy: Equatable, Sendable {
    public let backgroundColorRole: DSColorRole
    public let iconColorRole: DSColorRole
    public let iconName: String
    public let accessibilityLabel: String

    /// fallback 스타일 정책을 생성합니다.
    ///
    /// - Parameters:
    ///   - backgroundColorRole: fallback 배경 색상 역할입니다.
    ///   - iconColorRole: fallback 아이콘 색상 역할입니다.
    ///   - iconName: fallback에 사용할 system image 이름입니다.
    ///   - accessibilityLabel: 이미지 실패 상태 접근성 레이블입니다.
    public init(
        backgroundColorRole: DSColorRole,
        iconColorRole: DSColorRole,
        iconName: String,
        accessibilityLabel: String
    ) {
        self.backgroundColorRole = backgroundColorRole
        self.iconColorRole = iconColorRole
        self.iconName = iconName
        self.accessibilityLabel = accessibilityLabel
    }

    /// 일반 이미지 로딩 실패 영역에서 사용하는 기본 fallback 정책입니다.
    public static let imageLoadFailure = DSImageFallbackPolicy(
        backgroundColorRole: .surface,
        iconColorRole: .textDisabled,
        iconName: "photo",
        accessibilityLabel: DSAccessibilityLabel.error
    )
}

/// 이미지 크기, 비율, 맞춤 방식, 상태 스타일, 선명도 기준을 묶은 표시 정책입니다.
public struct DSImageStylePolicy: Equatable, Sendable {
    public let displaySize: DSImageDisplaySize
    public let aspectRatio: DSImageAspectRatio
    public let contentMode: DSImageContentMode
    public let cornerRadius: CGFloat
    public let placeholder: DSImagePlaceholderPolicy
    public let fallback: DSImageFallbackPolicy
    public let minimumSourceScale: CGFloat

    /// 이미지 표시 정책을 생성합니다.
    ///
    /// - Parameters:
    ///   - displaySize: pt 단위 표시 크기입니다.
    ///   - aspectRatio: `width / height` 기준 비율 정책입니다.
    ///   - contentMode: 표시 영역에 맞추는 방식입니다.
    ///   - cornerRadius: 이미지 clipping에 사용할 모서리 반경입니다.
    ///   - placeholder: 로딩 중 표시할 스타일 정책입니다.
    ///   - fallback: 실패 시 표시할 스타일 정책입니다.
    ///   - minimumSourceScale: logical size 대비 필요한 최소 원본 배율입니다.
    public init(
        displaySize: DSImageDisplaySize,
        aspectRatio: DSImageAspectRatio,
        contentMode: DSImageContentMode,
        cornerRadius: CGFloat,
        placeholder: DSImagePlaceholderPolicy,
        fallback: DSImageFallbackPolicy,
        minimumSourceScale: CGFloat
    ) {
        precondition(aspectRatio.isValid, "DSImageAspectRatio는 0보다 커야 합니다.")
        precondition(minimumSourceScale > 0, "minimumSourceScale은 0보다 커야 합니다.")

        self.displaySize = displaySize
        self.aspectRatio = aspectRatio
        self.contentMode = contentMode
        self.cornerRadius = cornerRadius
        self.placeholder = placeholder
        self.fallback = fallback
        self.minimumSourceScale = minimumSourceScale
    }
}

public extension DSImageStylePolicy {
    /// 검색 결과 목록에서 사용하는 앱 아이콘 이미지 정책입니다.
    static let appIconList = DSImageStylePolicy(
        displaySize: .square(DSImageSize.appIconSm),
        aspectRatio: .square,
        contentMode: .fit,
        cornerRadius: DSCornerRadius.sm,
        placeholder: .image,
        fallback: .imageLoadFailure,
        minimumSourceScale: 2
    )

    /// 상세 화면 상단에서 사용하는 앱 아이콘 이미지 정책입니다.
    static let appIconDetail = DSImageStylePolicy(
        displaySize: .square(DSImageSize.appIconLg),
        aspectRatio: .square,
        contentMode: .fit,
        cornerRadius: DSCornerRadius.lg,
        placeholder: .image,
        fallback: .imageLoadFailure,
        minimumSourceScale: 3
    )

    /// 목록 부가 이미지에 사용하는 썸네일 정책입니다.
    static let thumbnail = DSImageStylePolicy(
        displaySize: .square(DSImageSize.thumbnail),
        aspectRatio: .square,
        contentMode: .fill,
        cornerRadius: DSCornerRadius.sm,
        placeholder: .image,
        fallback: .imageLoadFailure,
        minimumSourceScale: 2
    )

    /// 사용자 프로필 이미지 정책입니다.
    static let profile = DSImageStylePolicy(
        displaySize: .square(DSImageSize.profile),
        aspectRatio: .square,
        contentMode: .fill,
        cornerRadius: DSCornerRadius.pill,
        placeholder: .image,
        fallback: .imageLoadFailure,
        minimumSourceScale: 2
    )

    /// 콘텐츠 카드 이미지 정책입니다.
    static let card = DSImageStylePolicy(
        displaySize: DSImageDisplaySize(width: DSImageSize.card, height: 90),
        aspectRatio: .ratio(4 / 3),
        contentMode: .fill,
        cornerRadius: DSCornerRadius.md,
        placeholder: .image,
        fallback: .imageLoadFailure,
        minimumSourceScale: 2
    )

    /// 상단 또는 프로모션 배너 이미지 정책입니다.
    static let banner = DSImageStylePolicy(
        displaySize: DSImageDisplaySize(width: DSImageSize.banner, height: 112.5),
        aspectRatio: .ratio(16 / 9),
        contentMode: .fill,
        cornerRadius: DSCornerRadius.md,
        placeholder: .image,
        fallback: .imageLoadFailure,
        minimumSourceScale: 3
    )
}
