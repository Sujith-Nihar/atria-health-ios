# AGENTS.md

Guidance for coding agents working in the Atria repository.

## Tooling

- Always use `mise exec -- tuist` (Tuist `4.203.4`).
- Generate with `mise exec -- tuist generate --no-open` — never open Xcode from scripts.
- Prefer `make` targets or `scripts/*.sh` over ad-hoc absolute paths.
- Do not hardcode an Apple Developer Team ID.

## Target graph

```
AtriaCore
  ↑
AtriaDesignSystem
  ↑
Atria (embeds AtriaWatch)     AtriaWatch
  ↑                             ↑
AtriaTests                    AtriaWatchTests
```

- `AtriaCore`: domain types + DI contracts only. No SwiftUI, SwiftData, HealthKit, WatchConnectivity, WidgetKit, or Foundation Models.
- `AtriaDesignSystem`: tokens + SwiftUI components. May depend on `AtriaCore`.
- Do not create `AtriaData` or `AtriaHealth` unless explicitly requested.

## UI rules

- iPhone tabs: Today, Trends, Workouts, Coach, Settings — each with `NavigationStack` and its own feature folder.
- Watch surfaces: Today, Start Workout, Quick Log — mock data only.
- Views must not access HealthKit, SwiftData, WatchConnectivity, or Foundation Models directly.
- Prefer immutable value types and injected dependencies (`AppDependencies`).

## Out of scope unless asked

HealthKit, workout recording, SwiftData persistence, WatchConnectivity, recovery/sleep/strain calculations, Foundation Models, widgets, networking, backend services, accounts, subscriptions, analytics SDKs.

## Validation before finishing work

1. `git diff --check`
2. `./scripts/generate.sh`
3. `./scripts/build-ios.sh`
4. `./scripts/build-watch.sh`
5. `./scripts/test.sh`

Do not create Git commits unless the user explicitly asks.
