import Foundation
import Testing
@testable import Atria
import AtriaCore

struct AtriaTests {
    @Test func mockTodaySummaryIsStable() {
        let provider = MockPlaceholderDataProvider()
        let summary = provider.todaySummary()
        #expect(summary.metricLabel == "Readiness")
        #expect(summary.metricValue == "82")
    }

    @Test func appDependenciesUseInjectedClock() {
        let fixed = Date(timeIntervalSince1970: 1_700_000_000)
        let dependencies = AppDependencies(clock: FixedClock(date: fixed))
        #expect(dependencies.clock.now() == fixed)
    }
}
