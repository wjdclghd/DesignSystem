import CoreGraphics

/// 아이콘 크기 토큰.
///
/// `Image` 프레임 및 `font(.system(size:))` 등에 사용합니다.
public enum DSIconSize {
    public static let xs: CGFloat  = 12
    public static let sm: CGFloat  = 16
    public static let md: CGFloat  = 20
    public static let lg: CGFloat  = 24
    public static let xl: CGFloat  = 32
    public static let xxl: CGFloat = 40

}

// MARK: - Preview

#if canImport(SwiftUI)
import SwiftUI

#Preview("DSIconSize") {
    VStack(spacing: DSSpacing.md) {
        ForEach(iconSizeItems, id: \.0) { name, value in
            HStack(spacing: DSSpacing.sm) {
                Image(systemName: "star.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: value, height: value)
                    .foregroundStyle(DSColor.primary)
                Text("\(name)  \(Int(value))pt")
                    .font(DSTypography.caption1)
                    .foregroundStyle(DSColor.textSecondary)
                Spacer()
            }
        }
    }
    .padding(DSSpacing.md)
}

private let iconSizeItems: [(String, CGFloat)] = [
    ("xs",  DSIconSize.xs),
    ("sm",  DSIconSize.sm),
    ("md",  DSIconSize.md),
    ("lg",  DSIconSize.lg),
    ("xl",  DSIconSize.xl),
    ("xxl", DSIconSize.xxl)
]
#endif
