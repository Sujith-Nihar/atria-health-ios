import Foundation

/// Immutable mock summary used by placeholder UI surfaces.
public struct DaySummary: Equatable, Sendable {
    public let title: String
    public let subtitle: String
    public let metricLabel: String
    public let metricValue: String

    public init(
        title: String,
        subtitle: String,
        metricLabel: String,
        metricValue: String
    ) {
        self.title = title
        self.subtitle = subtitle
        self.metricLabel = metricLabel
        self.metricValue = metricValue
    }
}

/// Immutable mock workout row for placeholder lists.
public struct WorkoutSummary: Equatable, Identifiable, Sendable {
    public let id: UUID
    public let name: String
    public let detail: String
    public let durationLabel: String

    public init(
        id: UUID = UUID(),
        name: String,
        detail: String,
        durationLabel: String
    ) {
        self.id = id
        self.name = name
        self.detail = detail
        self.durationLabel = durationLabel
    }
}

/// Immutable mock trend point for placeholder charts/lists.
public struct TrendPoint: Equatable, Identifiable, Sendable {
    public let id: UUID
    public let label: String
    public let valueLabel: String

    public init(
        id: UUID = UUID(),
        label: String,
        valueLabel: String
    ) {
        self.id = id
        self.label = label
        self.valueLabel = valueLabel
    }
}
