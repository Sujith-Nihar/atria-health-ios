import AtriaDesignSystem
import SwiftUI

struct SettingsView: View {
    var body: some View {
        NavigationStack {
            List {
                Section("About") {
                    PlaceholderCard(
                        title: "Atria",
                        subtitle: "iPhone foundation build. Accounts, analytics, and subscriptions are not included."
                    )
                    .listRowInsets(EdgeInsets())
                    .listRowSeparator(.hidden)
                }

                Section("Privacy") {
                    PlaceholderCard(
                        title: "Health access",
                        subtitle: "HealthKit is not requested in this build."
                    )
                    .listRowInsets(EdgeInsets())
                    .listRowSeparator(.hidden)
                }
            }
            .listStyle(.insetGrouped)
            .navigationTitle("Settings")
        }
    }
}

#Preview {
    SettingsView()
}
