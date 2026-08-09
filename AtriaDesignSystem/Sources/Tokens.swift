import SwiftUI

/// Spacing tokens shared across iPhone and Watch surfaces.
public enum AtriaSpacing {
    public static let xs: CGFloat = 4
    public static let sm: CGFloat = 8
    public static let md: CGFloat = 16
    public static let lg: CGFloat = 24
    public static let xl: CGFloat = 32
}

/// Typography scale for placeholder screens.
public enum AtriaTypography {
    public static let title = Font.title2.weight(.semibold)
    public static let headline = Font.headline
    public static let body = Font.body
    public static let caption = Font.caption
    public static let metric = Font.system(.largeTitle, design: .rounded).weight(.bold)
}

/// Color tokens kept intentionally simple until a full palette lands.
public enum AtriaColors {
    public static let accent = Color.accentColor
    public static let secondaryText = Color.secondary
    public static let background = Color.clear
}
