import AtriaDesignSystem
import SwiftUI

struct QuickLogView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: AtriaSpacing.sm) {
                    PlaceholderCard(
                        title: "Quick Log",
                        subtitle: "Mock shortcuts for effort, mood, and notes."
                    )
                    PlaceholderCard(
                        title: "Effort",
                        subtitle: "Moderate (placeholder)"
                    )
                    PlaceholderCard(
                        title: "Mood",
                        subtitle: "Steady (placeholder)"
                    )
                }
            }
            .navigationTitle("Quick Log")
        }
    }
}

#Preview {
    QuickLogView()
}
