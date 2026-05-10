import CoreGraphics

/// 모서리 반경 토큰.
///
/// `cornerRadius`, `clipShape` 등에 사용합니다.
public enum DSCornerRadius {
    public static let none: CGFloat = 0
    public static let xs: CGFloat   = 4
    public static let sm: CGFloat   = 8
    public static let md: CGFloat   = 12
    public static let lg: CGFloat   = 16
    public static let xl: CGFloat   = 24
    public static let pill: CGFloat = 999
}

// MARK: - Preview

#if canImport(SwiftUI)
import SwiftUI

#Preview("DSCornerRadius") {
    ScrollView {
        VStack(spacing: DSSpacing.sm) {
            ForEach(cornerRadiusItems, id: \.0) { name, value in
                HStack {
                    Text("\(name)  \(Int(value))pt")
                        .font(DSTypography.caption1)
                        .foregroundStyle(DSColor.textSecondary)
                        .frame(width: 100, alignment: .leading)
                    RoundedRectangle(cornerRadius: value)
                        .fill(DSColor.primary)
                        .frame(height: 40)
                }
            }
        }
        .padding(DSSpacing.md)
    }
}

private let cornerRadiusItems: [(String, CGFloat)] = [
    ("none", DSCornerRadius.none),
    ("xs",   DSCornerRadius.xs),
    ("sm",   DSCornerRadius.sm),
    ("md",   DSCornerRadius.md),
    ("lg",   DSCornerRadius.lg),
    ("xl",   DSCornerRadius.xl),
    ("pill", DSCornerRadius.pill)
]
#endif
