import AtriaDesignSystem
import SwiftUI

struct StartWorkoutView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: AtriaSpacing.sm) {
                    PlaceholderCard(
                        title: "Start Workout",
                        subtitle: "Mock entry point. Recording and HealthKit are not enabled."
                    )
                    PlaceholderCard(
                        title: "Suggested",
                        subtitle: "Easy Run · 40 min"
                    )
                }
            }
            .navigationTitle("Workout")
        }
    }
}

#Preview {
    StartWorkoutView()
}
