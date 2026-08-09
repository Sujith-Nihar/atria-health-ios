import Foundation
import Testing
@testable import AtriaWatch
import AtriaCore

struct AtriaWatchTests {
    @Test func mockWorkoutsAreNonEmpty() {
        let provider = MockPlaceholderDataProvider()
        #expect(!provider.recentWorkouts().isEmpty)
    }

    @Test func previewDependenciesAreSendable() {
        let dependencies = AppDependencies.preview
        #expect(dependencies.placeholders.coachMessage().isEmpty == false)
    }
}
