import Foundation

/// Supplies immutable mock domain values for UI scaffolding.
public protocol PlaceholderDataProviding: Sendable {
    func todaySummary() -> DaySummary
    func trendPoints() -> [TrendPoint]
    func recentWorkouts() -> [WorkoutSummary]
    func coachMessage() -> String
}

/// Deterministic mock data used until real services exist.
public struct MockPlaceholderDataProvider: PlaceholderDataProviding {
    public init() {}

    public func todaySummary() -> DaySummary {
        DaySummary(
            title: "Today",
            subtitle: "Mock readiness snapshot",
            metricLabel: "Readiness",
            metricValue: "82"
        )
    }

    public func trendPoints() -> [TrendPoint] {
        [
            TrendPoint(label: "Mon", valueLabel: "74"),
            TrendPoint(label: "Tue", valueLabel: "79"),
            TrendPoint(label: "Wed", valueLabel: "81"),
            TrendPoint(label: "Thu", valueLabel: "76"),
            TrendPoint(label: "Fri", valueLabel: "84"),
        ]
    }

    public func recentWorkouts() -> [WorkoutSummary] {
        [
            WorkoutSummary(
                name: "Easy Run",
                detail: "Zone 2 · Outdoor",
                durationLabel: "42 min"
            ),
            WorkoutSummary(
                name: "Strength",
                detail: "Full body · Gym",
                durationLabel: "55 min"
            ),
            WorkoutSummary(
                name: "Mobility",
                detail: "Recovery · Home",
                durationLabel: "20 min"
            ),
        ]
    }

    public func coachMessage() -> String {
        "Keep today's effort easy. Mock coach guidance only — no live model or health data."
    }
}
