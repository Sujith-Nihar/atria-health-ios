import AtriaCore
import SwiftUI

private enum AppDependenciesKey: EnvironmentKey {
    static let defaultValue = AppDependencies.live
}

public extension EnvironmentValues {
    var appDependencies: AppDependencies {
        get { self[AppDependenciesKey.self] }
        set { self[AppDependenciesKey.self] = newValue }
    }
}

public extension View {
    func appDependencies(_ dependencies: AppDependencies) -> some View {
        environment(\.appDependencies, dependencies)
    }
}
