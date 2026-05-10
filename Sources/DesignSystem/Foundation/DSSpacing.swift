import CoreGraphics

/// 간격 토큰.
///
/// `padding`, `spacing` 등 View 간격에 사용합니다.
public enum DSSpacing {
    public static let none: CGFloat = 0
    public static let xs: CGFloat   = 4
    public static let sm: CGFloat   = 8
    public static let md: CGFloat   = 16
    public static let lg: CGFloat   = 24
    public static let xl: CGFloat   = 32
    public static let xxl: CGFloat  = 48
}

// MARK: - Preview

#if canImport(SwiftUI)
import SwiftUI

#Preview("DSSpacing") {
    ScrollView {
        VStack(alignment: .leading, spacing: DSSpacing.sm) {
            ForEach(spacingItems, id: \.0) { name, value in
                HStack(spacing: DSSpacing.sm) {
                    Rectangle()
                        .fill(DSColor.primary)
                        .frame(width: value, height: 20)
                    Text("\(name)  \(Int(value))pt")
                        .font(DSTypography.caption1)
                        .foregroundStyle(DSColor.textSecondary)
                }
            }
        }
        .padding(DSSpacing.md)
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

private let spacingItems: [(String, CGFloat)] = [
    ("none", DSSpacing.none),
    ("xs",   DSSpacing.xs),
    ("sm",   DSSpacing.sm),
    ("md",   DSSpacing.md),
    ("lg",   DSSpacing.lg),
    ("xl",   DSSpacing.xl),
    ("xxl",  DSSpacing.xxl)
]
#endif
