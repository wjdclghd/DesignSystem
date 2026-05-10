import SwiftUI

/// DSShadow 토큰에 사용되는 그림자 속성을 담습니다.
public struct DSShadowStyle: Equatable, Sendable {
    public let color: Color
    public let opacity: Double
    public let radius: CGFloat
    public let x: CGFloat
    public let y: CGFloat

    public init(color: Color, opacity: Double, radius: CGFloat, x: CGFloat, y: CGFloat) {
        self.color = color
        self.opacity = opacity
        self.radius = radius
        self.x = x
        self.y = y
    }
}

/// 그림자 토큰.
public enum DSShadow {
    public static let none   = DSShadowStyle(color: .black, opacity: 0.00, radius: 0,  x: 0, y: 0)
    public static let low    = DSShadowStyle(color: .black, opacity: 0.08, radius: 4,  x: 0, y: 2)
    public static let medium = DSShadowStyle(color: .black, opacity: 0.12, radius: 8,  x: 0, y: 4)
    public static let high   = DSShadowStyle(color: .black, opacity: 0.16, radius: 16, x: 0, y: 8)
}

// MARK: - Preview

#Preview("DSShadow — Light") {
    ShadowPreviewList()
}

#Preview("DSShadow — Dark") {
    ShadowPreviewList()
        .preferredColorScheme(.dark)
}

private struct ShadowPreviewList: View {
    var body: some View {
        VStack(spacing: DSSpacing.lg) {
            ForEach(shadowItems, id: \.0) { name, style in
                VStack(spacing: DSSpacing.xs) {
                    RoundedRectangle(cornerRadius: DSCornerRadius.md)
                        .fill(DSColor.surface)
                        .frame(height: 56)
                        .shadow(
                            color: style.color.opacity(style.opacity),
                            radius: style.radius,
                            x: style.x,
                            y: style.y
                        )
                    Text(name)
                        .font(DSTypography.caption1)
                        .foregroundStyle(DSColor.textSecondary)
                }
            }
        }
        .padding(DSSpacing.xl)
        .background(DSColor.background)
    }
}

private let shadowItems: [(String, DSShadowStyle)] = [
    ("none",   DSShadow.none),
    ("low",    DSShadow.low),
    ("medium", DSShadow.medium),
    ("high",   DSShadow.high)
]
