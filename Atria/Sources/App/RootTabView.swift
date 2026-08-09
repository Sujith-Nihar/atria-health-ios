import SwiftUI

/// Root composition for the iPhone app.
struct RootTabView: View {
    var body: some View {
        TabView {
            TodayView()
                .tabItem {
                    Label("Today", systemImage: "sun.max")
                }

            TrendsView()
                .tabItem {
                    Label("Trends", systemImage: "chart.line.uptrend.xyaxis")
                }

            WorkoutsView()
                .tabItem {
                    Label("Workouts", systemImage: "figure.run")
                }

            CoachView()
                .tabItem {
                    Label("Coach", systemImage: "bubble.left.and.bubble.right")
                }

            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "gearshape")
                }
        }
    }
}

#Preview {
    RootTabView()
}
