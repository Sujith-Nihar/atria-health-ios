import SwiftUI

/// Root navigation for the Watch companion.
struct WatchRootView: View {
    var body: some View {
        TabView {
            WatchTodayView()
            StartWorkoutView()
            QuickLogView()
        }
        .tabViewStyle(.verticalPage)
    }
}

#Preview {
    WatchRootView()
}
