import AtriaDesignSystem
import SwiftUI

struct TrendsView: View {
    @Environment(\.appDependencies) private var dependencies

    var body: some View {
        NavigationStack {
            List {
                Section("This week (mock)") {
                    ForEach(dependencies.placeholders.trendPoints()) { point in
                        PlaceholderCard(
                            title: point.label,
                            subtitle: "Mock trend value",
                            trailing: point.valueLabel
                        )
                        .listRowInsets(EdgeInsets())
                        .listRowSeparator(.hidden)
                    }
                }
            }
            .listStyle(.plain)
            .navigationTitle("Trends")
        }
    }
}

#Preview {
    TrendsView()
        .appDependencies(.preview)
}
