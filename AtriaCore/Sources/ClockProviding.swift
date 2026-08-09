import Foundation

/// Provides the current point in time without binding callers to `Date()`.
public protocol ClockProviding: Sendable {
    func now() -> Date
}

/// System clock backed by `Date()`.
public struct SystemClock: ClockProviding {
    public init() {}

    public func now() -> Date {
        Date()
    }
}

/// Fixed clock for previews and tests.
public struct FixedClock: ClockProviding {
    private let date: Date

    public init(date: Date) {
        self.date = date
    }

    public func now() -> Date {
        date
    }
}
