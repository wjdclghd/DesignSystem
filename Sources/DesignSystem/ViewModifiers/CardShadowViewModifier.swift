import SwiftUI

/// 카드 그림자 수식어에 적용하는 순수 스타일 정책입니다.
public struct CardShadowStylePolicy: Equatable, Sendable {
    public let cornerRadius: CGFloat
    public let shadow: DSShadowStyle

    public init(cornerRadius: CGFloat, shadow: DSShadowStyle) {
        self.cornerRadius = cornerRadius
        self.shadow = shadow
    }

    public static let `default` = CardShadowStylePolicy(
        cornerRadius: DSCornerRadius.md,
        shadow: DSShadow.low
    )
}

/// 카드 그림자 수식어.
///
/// `DSShadow.low` + `DSCornerRadius.md` 조합을 캡슐화합니다.
public struct CardShadowViewModifier: ViewModifier {
    private let policy: CardShadowStylePolicy

    public init(policy: CardShadowStylePolicy = .default) {
        self.policy = policy
    }

    public func body(content: Content) -> some View {
        content
            .clipShape(RoundedRectangle(cornerRadius: policy.cornerRadius))
            .shadow(
                color: policy.shadow.color.opacity(policy.shadow.opacity),
                radius: policy.shadow.radius,
                x: policy.shadow.x,
                y: policy.shadow.y
            )
    }
}

public extension View {
    /// 카드 그림자 스타일을 적용합니다.
    func cardShadow() -> some View {
        modifier(CardShadowViewModifier())
    }
}

// MARK: - Preview

#Preview("CardShadow — Light") {
    RoundedRectangle(cornerRadius: DSCornerRadius.md)
        .fill(DSColor.surface)
        .frame(width: 280, height: 100)
        .cardShadow()
        .padding(DSSpacing.xl)
        .background(DSColor.background)
}

#Preview("CardShadow — Dark") {
    RoundedRectangle(cornerRadius: DSCornerRadius.md)
        .fill(DSColor.surface)
        .frame(width: 280, height: 100)
        .cardShadow()
        .padding(DSSpacing.xl)
        .background(DSColor.background)
        .preferredColorScheme(.dark)
}
