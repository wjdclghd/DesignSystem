import SwiftUI
#if canImport(UIKit)
import UIKit
#endif

/// DesignSystem 색상 토큰의 시멘틱 역할입니다.
public enum DSColorRole: String, CaseIterable, Sendable {
    case primary = "color_primary"
    case onPrimary = "color_on_primary"
    case secondary = "color_secondary"
    case onSecondary = "color_on_secondary"
    case background = "color_background"
    case onBackground = "color_on_background"
    case surface = "color_surface"
    case onSurface = "color_on_surface"
    case outline = "color_outline"
    case error = "color_error"
    case onError = "color_on_error"
    case textPrimary = "color_text_primary"
    case textSecondary = "color_text_secondary"
    case textDisabled = "color_text_disabled"
}

/// xcassets Color Set 기반 시멘틱 색상 토큰.
///
/// Light / Dark 전환은 xcassets Color Set이 자동으로 처리합니다.
/// View에서 `colorScheme` 분기 없이 사용합니다.
public enum DSColor {

    // MARK: - Primary

    public static let primary = color(for: .primary)
    public static let onPrimary = color(for: .onPrimary)

    // MARK: - Secondary

    public static let secondary = color(for: .secondary)
    public static let onSecondary = color(for: .onSecondary)

    // MARK: - Background

    public static let background = color(for: .background)
    public static let onBackground = color(for: .onBackground)

    // MARK: - Surface

    public static let surface = color(for: .surface)
    public static let onSurface = color(for: .onSurface)

    // MARK: - Outline

    public static let outline = color(for: .outline)

    // MARK: - Error

    public static let error = color(for: .error)
    public static let onError = color(for: .onError)

    // MARK: - Text

    public static let textPrimary = color(for: .textPrimary)
    public static let textSecondary = color(for: .textSecondary)
    public static let textDisabled = color(for: .textDisabled)

    /// 시멘틱 역할에 연결된 asset name을 반환합니다.
    public static func assetName(for role: DSColorRole) -> String {
        role.rawValue
    }

    /// 시멘틱 역할에 연결된 SwiftUI 색상을 반환합니다.
    public static func color(for role: DSColorRole) -> Color {
        Color(assetName(for: role), bundle: .module)
    }

    #if canImport(UIKit)
    /// 시멘틱 역할에 연결된 UIKit 색상을 반환합니다.
    public static func uiColor(for role: DSColorRole) -> UIColor {
        UIColor(named: assetName(for: role), in: .module, compatibleWith: nil) ?? .label
    }
    #endif
}

// MARK: - Preview

#Preview("DSColor — Light") {
    ColorPreviewGrid()
}

#Preview("DSColor — Dark") {
    ColorPreviewGrid()
        .preferredColorScheme(.dark)
}

private struct ColorPreviewGrid: View {
    private let items: [(String, Color)] = [
        ("primary", DSColor.primary),
        ("onPrimary", DSColor.onPrimary),
        ("secondary", DSColor.secondary),
        ("onSecondary", DSColor.onSecondary),
        ("background", DSColor.background),
        ("onBackground", DSColor.onBackground),
        ("surface", DSColor.surface),
        ("onSurface", DSColor.onSurface),
        ("outline", DSColor.outline),
        ("error", DSColor.error),
        ("onError", DSColor.onError),
        ("textPrimary", DSColor.textPrimary),
        ("textSecondary", DSColor.textSecondary),
        ("textDisabled", DSColor.textDisabled)
    ]

    var body: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: DSSpacing.sm) {
                ForEach(items, id: \.0) { name, color in
                    VStack(spacing: DSSpacing.xs) {
                        RoundedRectangle(cornerRadius: DSCornerRadius.sm)
                            .fill(color)
                            .frame(height: 44)
                            .overlay(
                                RoundedRectangle(cornerRadius: DSCornerRadius.sm)
                                    .stroke(DSColor.outline.opacity(0.3), lineWidth: 0.5)
                            )
                        Text(name)
                            .font(DSTypography.caption2)
                            .foregroundStyle(DSColor.textPrimary)
                    }
                }
            }
            .padding(DSSpacing.md)
        }
    }
}
