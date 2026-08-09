import SwiftUI

/// Reusable placeholder card for mock feature content.
public struct PlaceholderCard: View {
    private let title: String
    private let subtitle: String
    private let trailing: String?

    public init(title: String, subtitle: String, trailing: String? = nil) {
        self.title = title
        self.subtitle = subtitle
        self.trailing = trailing
    }

    public var body: some View {
        VStack(alignment: .leading, spacing: AtriaSpacing.sm) {
            HStack(alignment: .firstTextBaseline) {
                Text(title)
                    .font(AtriaTypography.headline)
                Spacer(minLength: AtriaSpacing.sm)
                if let trailing {
                    Text(trailing)
                        .font(AtriaTypography.caption)
                        .foregroundStyle(AtriaColors.secondaryText)
                }
            }
            Text(subtitle)
                .font(AtriaTypography.body)
                .foregroundStyle(AtriaColors.secondaryText)
                .fixedSize(horizontal: false, vertical: true)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(AtriaSpacing.md)
    }
}

/// Large metric callout used on Today surfaces.
public struct MetricCallout: View {
    private let label: String
    private let value: String

    public init(label: String, value: String) {
        self.label = label
        self.value = value
    }

    public var body: some View {
        VStack(alignment: .leading, spacing: AtriaSpacing.xs) {
            Text(label.uppercased())
                .font(AtriaTypography.caption)
                .foregroundStyle(AtriaColors.secondaryText)
            Text(value)
                .font(AtriaTypography.metric)
                .foregroundStyle(AtriaColors.accent)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(AtriaSpacing.md)
    }
}

#Preview("PlaceholderCard") {
    PlaceholderCard(
        title: "Easy Run",
        subtitle: "Zone 2 · Outdoor",
        trailing: "42 min"
    )
    .padding()
}
