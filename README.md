# DesignSystem Module

Clean Architecture + MVVM 환경에서 App 타겟이 SPM 모듈로 의존하는 형태를 전제로 만든 DesignSystem 모듈입니다.
이 모듈은 **시각 토큰(Visual Token)** 과 **스타일 정책(Style Policy)** 을 중심으로 UI 일관성을 제공하며, xcassets 기반 색상·아이콘 리소스를 외부에 직접 노출하지 않고 **공개 토큰 + 시멘틱 계약 + 내부 리소스**로 역할을 분리합니다.

모듈 내부는 색상, 타이포그래피, 간격, 모서리 반경, 그림자, 아이콘, 이미지 크기 토큰과 ViewModifier, 접근성 레이블을 포함하며,
상위 계층은 `DSColor`, `DSTypography`, `DSSpacing` 등 공개 토큰을 통해 View에서 즉시 사용할 수 있습니다.

**요약**
- 색상 토큰: `DSColor` + `DSColorRole` + xcassets Color Set
- 타이포그래피 토큰: `DSTypography` + `DSTypographyStylePolicy`
- 간격 / 모서리 반경 / 아이콘 크기 / 이미지 크기: 스케일 기반 CGFloat 토큰
- 그림자 토큰: `DSShadow` + `DSShadowStyle`
- 아이콘 리소스: `DSIcon` + xcassets imageset (SVG, rendering-intent template)
- 스타일 정책: `CardShadowStylePolicy`, `InputBorderStylePolicy`, `SurfaceBackgroundStylePolicy`
- 컴포넌트 전용 정책: `DSBackButtonStylePolicy`, `DSIconStylePolicy`, `DSTabBarStylePolicy`, `DSImageStylePolicy`
- ViewModifier: `CardShadowViewModifier`, `InputBorderViewModifier`, `SurfaceBackgroundViewModifier`
- 접근성: `DSAccessibilityLabel`
- 다크모드: xcassets 기반 자동 전환, `colorScheme` 분기 없이 사용

---

**모듈 구조**
```text
DesignSystem/
├─ Package.swift
├─ Sources/
│  └─ DesignSystem/
│     ├─ Foundation/
│     │  ├─ DSColor.swift
│     │  ├─ DSCornerRadius.swift
│     │  ├─ DSIcon.swift
│     │  ├─ DSIconSize.swift
│     │  ├─ DSIconStylePolicy.swift
│     │  ├─ DSImageDisplaySize.swift
│     │  ├─ DSImageSize.swift
│     │  ├─ DSImageStylePolicy.swift
│     │  ├─ DSShadow.swift
│     │  ├─ DSSpacing.swift
│     │  ├─ DSTabBarStylePolicy.swift
│     │  ├─ DSTypography.swift
│     │  └─ DSBackButtonStylePolicy.swift
│     ├─ ViewModifiers/
│     │  ├─ CardShadowViewModifier.swift
│     │  ├─ InputBorderViewModifier.swift
│     │  └─ SurfaceBackgroundViewModifier.swift
│     ├─ Accessibility/
│     │  └─ DSAccessibilityLabel.swift
│     └─ Resources/
│        └─ Assets.xcassets/
│           ├─ Colors/
│           │  ├─ color_primary.colorset
│           │  ├─ color_on_primary.colorset
│           │  ├─ color_secondary.colorset
│           │  ├─ color_on_secondary.colorset
│           │  ├─ color_background.colorset
│           │  ├─ color_on_background.colorset
│           │  ├─ color_surface.colorset
│           │  ├─ color_on_surface.colorset
│           │  ├─ color_outline.colorset
│           │  ├─ color_error.colorset
│           │  ├─ color_on_error.colorset
│           │  ├─ color_text_primary.colorset
│           │  ├─ color_text_secondary.colorset
│           │  └─ color_text_disabled.colorset
│           └─ Icons/
│              ├─ ic_back_button.imageset
│              ├─ ic_delete_button.imageset
│              ├─ ic_line_3_horizontal.imageset
│              ├─ ic_play.imageset
│              ├─ ic_search.imageset
│              ├─ ic_search_delete_button.imageset
│              ├─ ic_search_up_button.imageset
│              └─ ic_spinner.imageset
└─ Tests/
   └─ DesignSystemTests/
      ├─ Foundation/
      │  ├─ DSColorTests.swift
      │  ├─ DSCornerRadiusTests.swift
      │  ├─ DSIconSizeTests.swift
      │  ├─ DSIconStylePolicyTests.swift
      │  ├─ DSImageDisplaySizeTests.swift
      │  ├─ DSImageSizeTests.swift
      │  ├─ DSImageStylePolicyTests.swift
      │  ├─ DSShadowTests.swift
      │  ├─ DSSpacingTests.swift
      │  ├─ DSTabBarStylePolicyTests.swift
      │  ├─ DSTypographyTests.swift
      │  └─ DSBackButtonStylePolicyTests.swift
      ├─ ViewModifiers/
      │  ├─ CardShadowStylePolicyTests.swift
      │  ├─ InputBorderStylePolicyTests.swift
      │  └─ SurfaceBackgroundStylePolicyTests.swift
      └─ Accessibility/
         └─ DSAccessibilityLabelTests.swift
```

---

**빠른 시작**

`DSColor`, `DSTypography`, `DSSpacing` 등 공개 토큰을 View에서 바로 사용합니다.

```swift
import DesignSystem

Text("앱 이름")
    .font(DSTypography.title1)
    .foregroundStyle(DSColor.textPrimary)

Rectangle()
    .fill(DSColor.primary)
    .frame(height: 48)
    .padding(.horizontal, DSSpacing.md)
```

아이콘은 `DSIcon` 토큰을 통해 접근합니다. 모든 아이콘은 `rendering-intent: template`으로 설정되어 있어 `foregroundStyle` 적용이 가능합니다.

```swift
DSIcon.magnifyingglass
    .resizable()
    .scaledToFit()
    .frame(width: DSIconSize.lg, height: DSIconSize.lg)
    .foregroundStyle(DSColor.textSecondary)
```

ViewModifier는 `.cardShadow()`, `.inputBorder()`, `.surfaceBackground()` 형태로 사용합니다.

```swift
RoundedRectangle(cornerRadius: DSCornerRadius.md)
    .fill(DSColor.surface)
    .cardShadow()

TextField("검색어", text: $query)
    .inputBorder()
```

---

**핵심 설계 방향**

- **토큰 계층 분리**
  View에서는 `DSColor`, `DSTypography`, `DSSpacing` 등 공개 토큰만 사용합니다.
  xcassets 에셋 이름, Color Set raw value, SVG 파일명은 모듈 내부에 감춥니다.

- **시멘틱 색상**
  `DSColor`는 용도(primary, surface, textPrimary 등) 기준 시멘틱 역할로 색상을 제공합니다.
  Light / Dark 전환은 xcassets Color Set이 자동으로 처리합니다. View에서 `colorScheme` 분기 없이 사용합니다.

- **스타일 정책 분리**
  ViewModifier가 사용하는 값(`cornerRadius`, `shadow`, `colorRole`, `lineWidth`)은 `StylePolicy` 타입으로 분리합니다.
  정책 타입은 `Equatable`, `Sendable`을 채택해 Unit Test와 값 비교에 적합합니다.

- **컴포넌트 전용 정책**
  `BackButton`, `TabBar`, `Icon`, `Image` 같은 UIComponents 또는 Feature가 반복 사용하는 스타일 규칙은 전용 StylePolicy 타입으로 고정합니다.
  View와 UIComponents는 정책 값을 주입받아 렌더링하고, 정책 결정 로직을 내부에 중복 구현하지 않습니다.

- **테스트 친화적인 구조**
  ViewModifier 렌더링 결과가 아니라 정책 타입 값을 Unit Test로 검증합니다.
  SwiftUI View 렌더링 결과 검증은 `#Preview`와 Catalog UI 테스트에서 담당합니다.

---

**Foundation 토큰**

### DSColor

`DSColorRole` enum이 시멘틱 역할을 정의하고, `DSColor`가 역할에 연결된 SwiftUI `Color` 또는 UIKit `UIColor`를 반환합니다.

```swift
public enum DSColor {
    public static let primary     = color(for: .primary)
    public static let background  = color(for: .background)
    public static let textPrimary = color(for: .textPrimary)

    public static func color(for role: DSColorRole) -> Color
    public static func uiColor(for role: DSColorRole) -> UIColor  // UIKit 환경에서만 사용
    public static func assetName(for role: DSColorRole) -> String
}
```

색상 역할:

| 역할 | 용도 |
|---|---|
| `primary` | 주요 액션 색상 |
| `onPrimary` | primary 위에 표시되는 텍스트/아이콘 색상 |
| `secondary` | 보조 액션 색상 |
| `onSecondary` | secondary 위에 표시되는 텍스트/아이콘 색상 |
| `background` | 화면 배경 색상 |
| `onBackground` | 배경 위에 표시되는 텍스트/아이콘 색상 |
| `surface` | 카드, 시트 등 표면 색상 |
| `onSurface` | surface 위에 표시되는 텍스트/아이콘 색상 |
| `outline` | 테두리, 구분선 색상 |
| `error` | 오류 상태 색상 |
| `onError` | error 위에 표시되는 텍스트/아이콘 색상 |
| `textPrimary` | 본문 기본 텍스트 색상 |
| `textSecondary` | 본문 보조 텍스트 색상 |
| `textDisabled` | 비활성 텍스트/아이콘 색상 |

### DSTypography

Dynamic Type을 지원하는 `Font.TextStyle` 기반 타이포그래피 토큰입니다. 커스텀 폰트 도입 시 이 파일만 수정합니다.

```swift
public enum DSTypography {
    public static let display:  Font  // largeTitle, bold
    public static let title1:   Font  // title, bold
    public static let title2:   Font  // title2, semibold
    public static let title3:   Font  // title3, semibold
    public static let headline: Font  // headline, semibold
    public static let body1:    Font  // body, regular
    public static let body2:    Font  // callout, regular
    public static let caption1: Font  // caption, regular
    public static let caption2: Font  // caption2, regular
    public static let label:    Font  // footnote, medium
}
```

정책 타입인 `DSTypographyStylePolicy`는 `textStyle`, `weight`, `lineHeight`를 함께 보관합니다.

```swift
public struct DSTypographyStylePolicy: Equatable, Sendable {
    public let textStyle: DSTypographyTextStyle
    public let weight: DSTypographyFontWeight
    public let lineHeight: CGFloat
}
```

### DSSpacing

`padding`, `spacing` 등 View 간격에 사용하는 스케일 토큰입니다.

| 토큰 | 값 |
|---|---|
| `none` | 0pt |
| `xs` | 4pt |
| `sm` | 8pt |
| `md` | 16pt |
| `lg` | 24pt |
| `xl` | 32pt |
| `xxl` | 48pt |

### DSCornerRadius

`cornerRadius`, `clipShape` 등에 사용하는 스케일 토큰입니다.

| 토큰 | 값 |
|---|---|
| `none` | 0pt |
| `xs` | 4pt |
| `sm` | 8pt |
| `md` | 12pt |
| `lg` | 16pt |
| `xl` | 24pt |
| `pill` | 999pt |

### DSShadow

그림자 토큰입니다. `DSShadowStyle`은 `color`, `opacity`, `radius`, `x`, `y`를 값 타입으로 담습니다.

| 토큰 | opacity | radius | y |
|---|---|---|---|
| `none` | 0.00 | 0pt | 0pt |
| `low` | 0.08 | 4pt | 2pt |
| `medium` | 0.12 | 8pt | 4pt |
| `high` | 0.16 | 16pt | 8pt |

### DSIconSize

`Image` 프레임 및 `font(.system(size:))`에 사용하는 아이콘 크기 스케일 토큰입니다. 컴포넌트 전용 크기는 이 토큰에 추가하지 않습니다.

| 토큰 | 값 |
|---|---|
| `xs` | 12pt |
| `sm` | 16pt |
| `md` | 20pt |
| `lg` | 24pt |
| `xl` | 32pt |
| `xxl` | 40pt |

### DSImageSize

고정 이미지 영역 크기에 사용하는 시멘틱 이미지 크기 토큰입니다.

| 토큰 | 값 | 용도 |
|---|---|---|
| `appIconSm` | 40pt | 목록 앱 아이콘 |
| `appIconMd` | 60pt | 중간 크기 앱 아이콘 |
| `appIconLg` | 80pt | 상세 화면 앱 아이콘 |
| `thumbnail` | 56pt | 목록 썸네일 |
| `profile` | 48pt | 프로필 이미지 |
| `card` | 120pt | 카드 이미지 |
| `banner` | 200pt | 배너 이미지 |

### DSIcon

xcassets 기반 아이콘 이미지 토큰입니다. 토큰 이름은 아이콘의 사용 용도가 아닌 **형태**를 기준으로 정의합니다.

| 토큰 | xcasset | 형태 |
|---|---|---|
| `chevronLeft` | `ic_back_button` | 왼쪽 꺾임 화살표 |
| `xmarkCircle` | `ic_delete_button` | 원형 X 마크 |
| `play` | `ic_play` | 삼각형 재생 |
| `magnifyingglass` | `ic_search` | 돋보기 |
| `xmark` | `ic_search_delete_button` | X 마크 |
| `arrowUpLeft` | `ic_search_up_button` | 위 왼쪽 화살표 |
| `spinner` | `ic_spinner` | 회전 로딩 원 |
| `lineThreeHorizontal` | `ic_line_3_horizontal` | 가로줄 3개 |

모든 아이콘은 `rendering-intent: template`으로 설정되어 있어 `foregroundStyle`로 색상을 지정합니다.

---

**스타일 정책**

### ViewModifier 정책

| 정책 타입 | ViewModifier | 기본값 |
|---|---|---|
| `CardShadowStylePolicy` | `CardShadowViewModifier` | `cornerRadius: .md`, `shadow: .low` |
| `InputBorderStylePolicy` | `InputBorderViewModifier` | `colorRole: .outline`, `cornerRadius: .sm`, `lineWidth: 1` |
| `SurfaceBackgroundStylePolicy` | `SurfaceBackgroundViewModifier` | `colorRole: .surface`, `cornerRadius: .md` |

View는 `.cardShadow()`, `.inputBorder()`, `.surfaceBackground()` 형태의 `View extension`으로 사용합니다.

```swift
// 카드 그림자
someView.cardShadow()

// 입력 필드 테두리
TextField(...)
    .inputBorder()

// 표면 배경
someView.surfaceBackground()
```

### 컴포넌트 전용 정책

| 정책 타입 | 주요 프로퍼티 | 기본 preset |
|---|---|---|
| `DSBackButtonStylePolicy` | `tapTargetSize`, `iconFrameSize`, `iconColorRole` | `.navigationBar` (tapTargetSize: 44, iconColorRole: `.textPrimary`) |
| `DSIconStylePolicy` | `size`, `colorRole` | `.tabBar` (lg, `.textSecondary`) / `.emptyState` (xxl, `.textDisabled`) / `.errorState` (xxl, `.error`) |
| `DSTabBarStylePolicy` | `iconSize`, `selectedColorRole`, `unselectedColorRole` | `.standard` (lg, `.primary`, `.textDisabled`) |
| `DSImageStylePolicy` | `displaySize`, `aspectRatio`, `contentMode`, `cornerRadius`, `placeholder`, `fallback`, `minimumSourceScale` | `.appIconList` / `.appIconDetail` / `.thumbnail` / `.profile` / `.card` / `.banner` |

`DSImageStylePolicy`는 `DSImageDisplaySize`, `DSImageAspectRatio`, `DSImageContentMode`, `DSImagePlaceholderPolicy`, `DSImageFallbackPolicy` 타입과 함께 이미지 표시 정책 전체를 표현합니다.

---

**DSAccessibilityLabel**

VoiceOver 액션 레이블 상수를 중앙 관리합니다. UIComponents와 Feature는 하드코딩 대신 이 상수를 사용합니다.

```swift
public enum DSAccessibilityLabel {
    // Navigation
    public static let back    = "뒤로"
    public static let forward = "앞으로"
    public static let close   = "닫기"
    public static let dismiss = "내리기"

    // Action
    public static let confirm = "확인"
    public static let cancel  = "취소"
    public static let search  = "검색"
    public static let menu    = "메뉴"
    public static let more    = "더 보기"
    public static let refresh = "새로 고침"

    // State
    public static let loading = "불러오는 중"
    public static let empty   = "내용 없음"
    public static let error   = "오류"
}
```

---

**xcassets 규칙**

### Colors

- 폴더: `Assets.xcassets/Colors/`
- 파일명 형식: `color_{semantic_role}.colorset`
- Light / Dark appearance는 Color Set 내부에서 정의합니다.
- `DSColor.assetName(for:)` 반환값과 파일명이 일치해야 합니다.

### Icons

- 폴더: `Assets.xcassets/Icons/`
- 파일명 형식: `ic_{shape_description}.imageset`
- 모든 아이콘은 SVG 형식이며 `preserves-vector-representation: true`, `rendering-intent: template`을 적용합니다.
- 아이콘 이름은 **형태** 기준입니다. 용도 기반 이름(예: `ic_back_button_icon`)은 사용하지 않습니다.

---

**테스트**

모듈은 Unit Test로 16개 테스트 파일을 포함합니다.

포함된 테스트 범위:
- Foundation 토큰: `DSColorTests`, `DSCornerRadiusTests`, `DSIconSizeTests`, `DSImageSizeTests`, `DSShadowTests`, `DSSpacingTests`, `DSTypographyTests`
- 스타일 정책: `DSIconStylePolicyTests`, `DSImageDisplaySizeTests`, `DSImageStylePolicyTests`, `DSTabBarStylePolicyTests`, `DSBackButtonStylePolicyTests`
- ViewModifier 정책: `CardShadowStylePolicyTests`, `InputBorderStylePolicyTests`, `SurfaceBackgroundStylePolicyTests`
- 접근성: `DSAccessibilityLabelTests`

테스트 전략:
- SwiftUI View의 렌더링 결과를 Unit Test에서 직접 검증하지 않습니다.
- 토큰 스케일 값, 시멘틱 매핑, 정책 타입 값을 중심으로 검증합니다.
- 시각 결과 검증은 `#Preview`와 App Target의 DesignSystem Catalog UI 테스트에서 담당합니다.
- 각 StylePolicy의 기본 preset(`default`, `navigationBar`, `standard` 등) 값도 테스트로 고정합니다.

```swift
func test_cardShadowStylePolicy_default_hasMdCornerRadius() {
    // given / when
    let policy = CardShadowStylePolicy.default

    // then
    XCTAssertEqual(policy.cornerRadius, DSCornerRadius.md)
}
```

---

**의존성 규칙**

| 의존 방향 | 허용 여부 |
|---|---|
| UIComponents → DesignSystem | 허용 |
| Feature → DesignSystem | 허용 |
| App Target → DesignSystem | 허용 |
| DesignSystem → AppDomain | 금지 |
| DesignSystem → AppData | 금지 |
| DesignSystem → Feature | 금지 |
| DesignSystem → Networking / Persistence / SearchEngine | 금지 |

DesignSystem은 `SwiftUI`, `CoreGraphics`, `UIKit`(조건부)만 의존합니다. 비즈니스 로직과 데이터 계층은 알지 않습니다.

---

**권장 확장 방식**
1. 색상 추가: `DSColorRole`에 역할 case 추가 → `Assets.xcassets/Colors/`에 Color Set 추가 → `DSColor`에 토큰 추가
2. 타이포그래피 추가: `DSTypography`에 Policy와 Font 토큰 추가
3. 간격 / 크기 토큰 추가: 해당 Foundation 파일에 스케일 case 추가
4. 아이콘 추가: `Assets.xcassets/Icons/`에 SVG imageset 추가 → `DSIcon`에 토큰 추가
5. ViewModifier 추가: `StylePolicy` 타입 먼저 정의 → `ViewModifiers/`에 `ViewModifier` 추가 → `View extension` 제공
6. 컴포넌트 정책 추가: `Foundation/`에 `DS{Component}StylePolicy.swift` 추가 → 기본 preset 정의
7. 접근성 레이블 추가: `DSAccessibilityLabel`에 상수 추가
8. 토큰 / 정책 변경 시 대응 Unit Test 추가 또는 수정

---

Created by: JEONG, Chi-hong  
Updated: May 2026
