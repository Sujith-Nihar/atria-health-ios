import AtriaDesignSystem
import SwiftUI

struct WatchTodayView: View {
    @Environment(\.appDependencies) private var dependencies

    var body: some View {
        NavigationStack {
            let summary = dependencies.placeholders.todaySummary()
            ScrollView {
                VStack(alignment: .leading, spacing: AtriaSpacing.sm) {
                    MetricCallout(label: summary.metricLabel, value: summary.metricValue)
                    PlaceholderCard(
                        title: summary.title,
                        subtitle: summary.subtitle
                    )
                }
            }
            .navigationTitle("Today")
        }
    }
}

#Preview {
    WatchTodayView()
        .appDependencies(.preview)
}
