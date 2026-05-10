import SwiftUI

/// 표면 배경 수식어에 적용하는 순수 스타일 정책입니다.
public struct SurfaceBackgroundStylePolicy: Equatable, Sendable {
    public let colorRole: DSColorRole
    public let cornerRadius: CGFloat

    public init(colorRole: DSColorRole, cornerRadius: CGFloat) {
        self.colorRole = colorRole
        self.cornerRadius = cornerRadius
    }

    public static let `default` = SurfaceBackgroundStylePolicy(
        colorRole: .surface,
        cornerRadius: DSCornerRadius.md
    )
}

/// 표면 배경 수식어.
///
/// `DSColor.surface` + `DSCornerRadius.md` 조합을 캡슐화합니다.
public struct SurfaceBackgroundViewModifier: ViewModifier {
    private let policy: SurfaceBackgroundStylePolicy

    public init(policy: SurfaceBackgroundStylePolicy = .default) {
        self.policy = policy
    }

    public func body(content: Content) -> some View {
        content
            .background(DSColor.color(for: policy.colorRole))
            .clipShape(RoundedRectangle(cornerRadius: policy.cornerRadius))
    }
}

public extension View {
    /// 표면 배경 스타일을 적용합니다.
    func surfaceBackground() -> some View {
        modifier(SurfaceBackgroundViewModifier())
    }
}

// MARK: - Preview

#Preview("SurfaceBackground — Light") {
    Text("Surface Background")
        .font(DSTypography.body1)
        .foregroundStyle(DSColor.textPrimary)
        .padding(DSSpacing.md)
        .surfaceBackground()
        .padding(DSSpacing.xl)
        .background(DSColor.background)
}

#Preview("SurfaceBackground — Dark") {
    Text("Surface Background")
        .font(DSTypography.body1)
        .foregroundStyle(DSColor.textPrimary)
        .padding(DSSpacing.md)
        .surfaceBackground()
        .padding(DSSpacing.xl)
        .background(DSColor.background)
        .preferredColorScheme(.dark)
}
