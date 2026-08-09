import Foundation

/// Application-wide dependencies injected at the composition root.
/// Views receive this via the environment instead of reaching into system frameworks.
public struct AppDependencies: Sendable {
    public let clock: any ClockProviding
    public let placeholders: any PlaceholderDataProviding

    public init(
        clock: any ClockProviding = SystemClock(),
        placeholders: any PlaceholderDataProviding = MockPlaceholderDataProvider()
    ) {
        self.clock = clock
        self.placeholders = placeholders
    }

    public static let live = AppDependencies()

    public static let preview = AppDependencies(
        clock: FixedClock(date: Date(timeIntervalSince1970: 1_700_000_000)),
        placeholders: MockPlaceholderDataProvider()
    )
}
