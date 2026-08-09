import AtriaCore
import AtriaDesignSystem
import SwiftUI

@main
struct AtriaWatchApp: App {
    private let dependencies = AppDependencies.live

    var body: some Scene {
        WindowGroup {
            WatchRootView()
                .appDependencies(dependencies)
        }
    }
}
