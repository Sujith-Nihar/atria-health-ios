# Atria

Native SwiftUI iPhone app with an Apple Watch companion. The project is generated with [Tuist](https://tuist.dev) and tool versions are pinned with [mise](https://mise.jdx.dev).

## Requirements

- macOS with Xcode that supports iOS 18 and watchOS 11
- [mise](https://mise.jdx.dev) (installs Tuist `4.203.4`)

## Quick start

```bash
mise install
make generate
make build-ios
make build-watch
make test
```

`make generate` runs `mise exec -- tuist generate --no-open` and does not open Xcode.

## Targets

| Target | Product | Platforms |
| --- | --- | --- |
| `Atria` | iPhone app | iOS 18+ |
| `AtriaWatch` | Watch companion | watchOS 11+ |
| `AtriaCore` | Shared domain | iOS + watchOS |
| `AtriaDesignSystem` | Shared SwiftUI | iOS + watchOS |
| `AtriaTests` | Unit tests | iOS |
| `AtriaWatchTests` | Unit tests | watchOS |

Bundle IDs:

- iPhone: `com.sujiththota.atria`
- Watch: `com.sujiththota.atria.watchapp`
- iOS tests: `com.sujiththota.atria.tests`
- Watch tests: `com.sujiththota.atria.watchtests`

No Apple Developer Team ID is hardcoded. Configure signing locally in Xcode when you need device builds.

## Architecture notes

- SwiftUI + structured concurrency
- Swift 6 / strict concurrency via xcconfig
- Feature folders per tab/screen
- Dependency injection through `AppDependencies` (no global mutable singletons)
- Views must not talk to HealthKit, SwiftData, WatchConnectivity, or Foundation Models directly

Not implemented yet: HealthKit, workout recording, SwiftData, WatchConnectivity, recovery math, widgets, networking, accounts, subscriptions, analytics.

## Scripts

| Command | Purpose |
| --- | --- |
| `make generate` | Generate the Xcode workspace |
| `make build-ios` | Build for `generic/platform=iOS Simulator` |
| `make build-watch` | Build for `generic/platform=watchOS Simulator` |
| `make test` | Run available unit tests |
| `make clean` | Remove generated projects and build products |
| `make check` | Full pre-commit gate |

## Configuration

Shared build settings live under `Config/`:

- `Shared.xcconfig`
- `Debug.xcconfig`
- `Release.xcconfig`
