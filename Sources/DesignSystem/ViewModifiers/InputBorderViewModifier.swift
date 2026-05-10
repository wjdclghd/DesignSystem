import SwiftUI

/// 입력 필드 테두리 수식어에 적용하는 순수 스타일 정책입니다.
public struct InputBorderStylePolicy: Equatable, Sendable {
    public let colorRole: DSColorRole
    public let cornerRadius: CGFloat
    public let lineWidth: CGFloat

    public init(colorRole: DSColorRole, cornerRadius: CGFloat, lineWidth: CGFloat) {
        self.colorRole = colorRole
        self.cornerRadius = cornerRadius
        self.lineWidth = lineWidth
    }

    public static let `default` = InputBorderStylePolicy(
        colorRole: .outline,
        cornerRadius: DSCornerRadius.sm,
        lineWidth: 1
    )
}

/// 입력 필드 테두리 수식어.
///
/// `DSColor.outline` + `DSCornerRadius.sm` + stroke 조합을 캡슐화합니다.
public struct InputBorderViewModifier: ViewModifier {
    private let policy: InputBorderStylePolicy

    public init(policy: InputBorderStylePolicy = .default) {
        self.policy = policy
    }

    public func body(content: Content) -> some View {
        content
            .clipShape(RoundedRectangle(cornerRadius: policy.cornerRadius))
            .overlay(
                RoundedRectangle(cornerRadius: policy.cornerRadius)
                    .stroke(DSColor.color(for: policy.colorRole), lineWidth: policy.lineWidth)
            )
    }
}

public extension View {
    /// 입력 필드 테두리 스타일을 적용합니다.
    func inputBorder() -> some View {
        modifier(InputBorderViewModifier())
    }
}

// MARK: - Preview

#Preview("InputBorder — Light") {
    Text("입력 필드")
        .font(DSTypography.body1)
        .foregroundStyle(DSColor.textPrimary)
        .padding(DSSpacing.md)
        .frame(maxWidth: .infinity, alignment: .leading)
        .inputBorder()
        .padding(DSSpacing.xl)
        .background(DSColor.background)
}

#Preview("InputBorder — Dark") {
    Text("입력 필드")
        .font(DSTypography.body1)
        .foregroundStyle(DSColor.textPrimary)
        .padding(DSSpacing.md)
        .frame(maxWidth: .infinity, alignment: .leading)
        .inputBorder()
        .padding(DSSpacing.xl)
        .background(DSColor.background)
        .preferredColorScheme(.dark)
}
