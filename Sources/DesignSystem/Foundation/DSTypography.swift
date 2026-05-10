import SwiftUI

/// Typography 토큰에 사용할 SwiftUI TextStyle 정책입니다.
public enum DSTypographyTextStyle: String, CaseIterable, Sendable {
    case largeTitle
    case title
    case title2
    case title3
    case headline
    case body
    case callout
    case caption
    case caption2
    case footnote

    var fontTextStyle: Font.TextStyle {
        switch self {
        case .largeTitle: return .largeTitle
        case .title: return .title
        case .title2: return .title2
        case .title3: return .title3
        case .headline: return .headline
        case .body: return .body
        case .callout: return .callout
        case .caption: return .caption
        case .caption2: return .caption2
        case .footnote: return .footnote
        }
    }
}

/// Typography 토큰에 사용할 font weight 정책입니다.
public enum DSTypographyFontWeight: String, CaseIterable, Sendable {
    case bold
    case semibold
    case regular
    case medium

    var fontWeight: Font.Weight {
        switch self {
        case .bold: return .bold
        case .semibold: return .semibold
        case .regular: return .regular
        case .medium: return .medium
        }
    }
}

/// Typography 토큰의 순수 정책 값입니다.
public struct DSTypographyStylePolicy: Equatable, Sendable {
    public let textStyle: DSTypographyTextStyle
    public let weight: DSTypographyFontWeight
    public let lineHeight: CGFloat

    public init(
        textStyle: DSTypographyTextStyle,
        weight: DSTypographyFontWeight,
        lineHeight: CGFloat
    ) {
        self.textStyle = textStyle
        self.weight = weight
        self.lineHeight = lineHeight
    }

    public var font: Font {
        Font.system(textStyle.fontTextStyle, design: .default)
            .weight(weight.fontWeight)
    }
}

/// `Font.TextStyle` 기반 타이포그래피 토큰.
///
/// 모든 폰트는 Dynamic Type 자동 스케일을 지원합니다.
/// 현재는 system font 기준이며, 커스텀 폰트 도입 시 이 파일만 수정합니다.
public enum DSTypography {
    public static let displayPolicy = DSTypographyStylePolicy(
        textStyle: .largeTitle,
        weight: .bold,
        lineHeight: 41
    )
    public static let title1Policy = DSTypographyStylePolicy(
        textStyle: .title,
        weight: .bold,
        lineHeight: 34
    )
    public static let title2Policy = DSTypographyStylePolicy(
        textStyle: .title2,
        weight: .semibold,
        lineHeight: 28
    )
    public static let title3Policy = DSTypographyStylePolicy(
        textStyle: .title3,
        weight: .semibold,
        lineHeight: 25
    )
    public static let headlinePolicy = DSTypographyStylePolicy(
        textStyle: .headline,
        weight: .semibold,
        lineHeight: 22
    )
    public static let body1Policy = DSTypographyStylePolicy(
        textStyle: .body,
        weight: .regular,
        lineHeight: 22
    )
    public static let body2Policy = DSTypographyStylePolicy(
        textStyle: .callout,
        weight: .regular,
        lineHeight: 20
    )
    public static let caption1Policy = DSTypographyStylePolicy(
        textStyle: .caption,
        weight: .regular,
        lineHeight: 16
    )
    public static let caption2Policy = DSTypographyStylePolicy(
        textStyle: .caption2,
        weight: .regular,
        lineHeight: 13
    )
    public static let labelPolicy = DSTypographyStylePolicy(
        textStyle: .footnote,
        weight: .medium,
        lineHeight: 18
    )

    public static let display = displayPolicy.font
    public static let title1 = title1Policy.font
    public static let title2 = title2Policy.font
    public static let title3 = title3Policy.font
    public static let headline = headlinePolicy.font
    public static let body1 = body1Policy.font
    public static let body2 = body2Policy.font
    public static let caption1 = caption1Policy.font
    public static let caption2 = caption2Policy.font
    public static let label = labelPolicy.font

    public static let allPolicies: [DSTypographyStylePolicy] = [
        displayPolicy,
        title1Policy,
        title2Policy,
        title3Policy,
        headlinePolicy,
        body1Policy,
        body2Policy,
        caption1Policy,
        caption2Policy,
        labelPolicy
    ]
}

// MARK: - Preview

#Preview("DSTypography — Light") {
    TypographyPreviewList()
}

#Preview("DSTypography — Dark") {
    TypographyPreviewList()
        .preferredColorScheme(.dark)
}

private struct TypographyPreviewList: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: DSSpacing.sm) {
                Group {
                    Text("display").font(DSTypography.display)
                    Text("title1").font(DSTypography.title1)
                    Text("title2").font(DSTypography.title2)
                    Text("title3").font(DSTypography.title3)
                    Text("headline").font(DSTypography.headline)
                    Text("body1").font(DSTypography.body1)
                    Text("body2").font(DSTypography.body2)
                    Text("caption1").font(DSTypography.caption1)
                    Text("caption2").font(DSTypography.caption2)
                    Text("label").font(DSTypography.label)
                }
                .foregroundStyle(DSColor.textPrimary)
            }
            .padding(DSSpacing.md)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}
