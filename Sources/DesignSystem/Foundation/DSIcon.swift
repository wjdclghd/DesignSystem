import SwiftUI

/// xcassets 기반 아이콘 이미지 토큰.
///
/// 모든 아이콘은 `rendering-intent: template`으로 설정되어 `foregroundStyle` 적용이 가능합니다.
public enum DSIcon {
    public static let chevronLeft         = Image("ic_back_button",          bundle: .module)
    public static let xmarkCircle         = Image("ic_delete_button",        bundle: .module)
    public static let play                = Image("ic_play",                 bundle: .module)
    public static let magnifyingglass     = Image("ic_search",               bundle: .module)
    public static let xmark               = Image("ic_search_delete_button", bundle: .module)
    public static let arrowUpLeft         = Image("ic_search_up_button",     bundle: .module)
    public static let spinner             = Image("ic_spinner",              bundle: .module)
    public static let menuButton           = Image("ic_menu_button",          bundle: .module)
}

// MARK: - Preview

#Preview("DSIcon — Light") {
    IconPreviewGrid()
}

#Preview("DSIcon — Dark") {
    IconPreviewGrid()
        .preferredColorScheme(.dark)
}

private struct IconPreviewGrid: View {
    var body: some View {
        ScrollView {
            LazyVGrid(
                columns: [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())],
                spacing: DSSpacing.lg
            ) {
                ForEach(iconItems, id: \.0) { name, image in
                    VStack(spacing: DSSpacing.xs) {
                        image
                            .resizable()
                            .scaledToFit()
                            .frame(width: DSIconSize.lg, height: DSIconSize.lg)
                            .foregroundStyle(DSColor.textPrimary)
                        Text(name)
                            .font(DSTypography.caption2)
                            .foregroundStyle(DSColor.textSecondary)
                            .multilineTextAlignment(.center)
                    }
                }
            }
            .padding(DSSpacing.md)
        }
        .background(DSColor.background)
    }
}

private let iconItems: [(String, Image)] = [
    ("chevronLeft",         DSIcon.chevronLeft),
    ("xmarkCircle",         DSIcon.xmarkCircle),
    ("play",                DSIcon.play),
    ("magnifyingglass",     DSIcon.magnifyingglass),
    ("xmark",               DSIcon.xmark),
    ("arrowUpLeft",         DSIcon.arrowUpLeft),
    ("spinner",             DSIcon.spinner),
    ("menuButton",          DSIcon.menuButton)
]
