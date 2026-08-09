import AtriaDesignSystem
import SwiftUI

struct WorkoutsView: View {
    @Environment(\.appDependencies) private var dependencies

    var body: some View {
        NavigationStack {
            List {
                Section("Recent (mock)") {
                    ForEach(dependencies.placeholders.recentWorkouts()) { workout in
                        PlaceholderCard(
                            title: workout.name,
                            subtitle: workout.detail,
                            trailing: workout.durationLabel
                        )
                        .listRowInsets(EdgeInsets())
                        .listRowSeparator(.hidden)
                    }
                }
            }
            .listStyle(.plain)
            .navigationTitle("Workouts")
        }
    }
}

#Preview {
    WorkoutsView()
        .appDependencies(.preview)
}
