import AtriaDesignSystem
import SwiftUI

struct CoachView: View {
    @Environment(\.appDependencies) private var dependencies

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: AtriaSpacing.md) {
                    PlaceholderCard(
                        title: "Coach",
                        subtitle: dependencies.placeholders.coachMessage()
                    )
                    PlaceholderCard(
                        title: "Coming later",
                        subtitle: "Foundation Models and live coaching are intentionally not wired yet."
                    )
                }
                .padding(AtriaSpacing.md)
            }
            .navigationTitle("Coach")
        }
    }
}

#Preview {
    CoachView()
        .appDependencies(.preview)
}
