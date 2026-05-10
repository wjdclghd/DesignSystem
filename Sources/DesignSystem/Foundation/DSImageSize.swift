import CoreGraphics

/// 이미지 크기 토큰.
///
/// 앱 아이콘, 썸네일, 프로필, 카드, 배너 등 고정 이미지 영역 크기에 사용합니다.
public enum DSImageSize {
    public static let appIconSm: CGFloat = 40
    public static let appIconMd: CGFloat = 60
    public static let appIconLg: CGFloat = 80
    public static let thumbnail: CGFloat = 56
    public static let profile: CGFloat   = 48
    public static let card: CGFloat      = 120
    public static let banner: CGFloat    = 200
}

// MARK: - Preview

#if canImport(SwiftUI)
import SwiftUI

#Preview("DSImageSize") {
    ScrollView {
        VStack(spacing: DSSpacing.md) {
            ForEach(imageSizeItems, id: \.0) { name, value in
                HStack(spacing: DSSpacing.sm) {
                    RoundedRectangle(cornerRadius: DSCornerRadius.sm)
                        .fill(DSColor.surface)
                        .frame(width: value, height: value)
                        .overlay(
                            Image(systemName: "photo")
                                .foregroundStyle(DSColor.textDisabled)
                        )
                    Text("\(name)  \(Int(value))pt")
                        .font(DSTypography.caption1)
                        .foregroundStyle(DSColor.textSecondary)
                    Spacer()
                }
            }
        }
        .padding(DSSpacing.md)
    }
}

private let imageSizeItems: [(String, CGFloat)] = [
    ("appIconSm", DSImageSize.appIconSm),
    ("appIconMd", DSImageSize.appIconMd),
    ("appIconLg", DSImageSize.appIconLg),
    ("thumbnail", DSImageSize.thumbnail),
    ("profile",   DSImageSize.profile),
    ("card",      DSImageSize.card),
    ("banner",    DSImageSize.banner)
]
#endif
