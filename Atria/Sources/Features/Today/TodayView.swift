import AtriaDesignSystem
import SwiftUI

struct TodayView: View {
    @Environment(\.appDependencies) private var dependencies

    var body: some View {
        NavigationStack {
            let summary = dependencies.placeholders.todaySummary()
            ScrollView {
                VStack(alignment: .leading, spacing: AtriaSpacing.md) {
                    MetricCallout(label: summary.metricLabel, value: summary.metricValue)
                    PlaceholderCard(
                        title: summary.title,
                        subtitle: summary.subtitle
                    )
                    PlaceholderCard(
                        title: "Placeholder only",
                        subtitle: "No HealthKit authorization or live metrics yet."
                    )
                }
                .padding(AtriaSpacing.md)
            }
            .navigationTitle("Today")
        }
    }
}

#Preview {
    TodayView()
        .appDependencies(.preview)
}
