# Atria

**A privacy-first personal health intelligence platform for iPhone and Apple Watch.**

Atria is designed to turn Apple Health and Apple Watch data into clear, personalized insights about **recovery, sleep, activity, workouts, calories, and long-term health trends**.

Instead of showing isolated numbers such as HRV, resting heart rate, sleep duration, or active calories, Atria combines those signals into explainable daily summaries so users can better understand **how their body is performing, how well they are recovering, and how training is affecting them over time**.

> **Product goal:** turn health data into useful daily guidance while keeping core analysis local and privacy-first.

---

## What Atria Is

Apple Watch and HealthKit collect a large amount of health and fitness information, but those measurements are often viewed independently.

Atria adds an intelligence layer on top of Apple Health.

For example, instead of only showing:

```text
HRV:            42 ms
Resting HR:     64 bpm
Sleep:          6h 21m
Active Energy:  720 kcal
Workout:        58 min
```

Atria is intended to provide an interpretation such as:

```text
Recovery: 61 / 100

Your recovery is below your recent baseline today.

Main contributors:
• HRV is lower than your personal baseline
• Resting heart rate is elevated
• Sleep duration was below your usual range
• Yesterday's training load was relatively high

Suggested focus:
Consider a lighter training day and prioritize sleep tonight.
```

The health score itself is calculated using deterministic application logic. AI is used only to **explain and summarize** the underlying evidence.

---

# Core Product Experience

Atria is being built around four primary responsibilities.

## 1. Sync

Securely read health and fitness information that the user explicitly authorizes through **Apple HealthKit**.

Planned supported data includes:

- Workouts
- Active energy burned
- Basal energy burned
- Step count
- Exercise time
- Walking and running distance
- Cycling distance
- Heart rate
- Resting heart rate
- Walking heart-rate average
- Heart-rate variability (HRV)
- Sleep analysis
- Respiratory rate
- Blood oxygen saturation when available
- Cardio fitness / VO₂ max
- Body mass
- Additional HealthKit metrics where useful and supported

HealthKit remains the **authoritative source of truth**.

Atria maintains a local, rebuildable representation of selected records and aggregates for fast analytics, trends, scoring, and offline use.

---

## 2. Track

Record workouts directly from Apple Watch.

Planned workout tracking includes:

- Walking
- Running
- Cycling
- Strength training
- Functional strength training
- HIIT
- Hiking
- Yoga
- Rowing
- Elliptical
- Other supported workout types

During an active workout, Atria is intended to display:

- Elapsed time
- Current heart rate
- Average heart rate
- Heart-rate zones
- Active calories
- Distance
- Pace or speed
- Workout state
- Pause / resume / finish controls

Completed workouts are saved back to HealthKit and then reconciled through the same synchronization pipeline used for other Apple Health data.

Atria will also support manual workout logging from iPhone, with clear distinction between:

- Watch-measured values
- User-entered values
- Estimated values
- Unavailable values

---

## 3. Understand

Transform raw health data into explainable personal trends and scores.

Planned analytics include:

### Recovery

Recovery considers signals such as:

- HRV relative to personal baseline
- Resting heart rate relative to baseline
- Sleep duration
- Sleep consistency
- Recent workout strain
- Respiratory metrics when available
- Data confidence and completeness

### Sleep

Sleep analysis can consider:

- Total sleep duration
- Sleep consistency
- Sleep efficiency
- Awake time
- Available sleep stages
- Sleep debt
- Long-term sleep trends

### Strain

Training strain can consider:

- Workout duration
- Heart-rate intensity
- Active energy
- Exercise time
- Non-workout movement
- Recent recovery state
- Historical training load

### Personal baselines

Atria is designed around **personal baselines**, not generic population averages.

Baseline calculations may use robust statistics such as:

- Median
- Percentiles
- Median absolute deviation
- Recency weighting
- Rolling historical windows

Every calculated score is intended to include:

- Score
- Confidence
- Algorithm version
- Supporting evidence
- Missing inputs
- Calculation timestamp

This makes the scoring system explainable and versionable.

---

## 4. Explain

Use **on-device AI** to turn deterministic analytics into understandable health insights.

Example questions:

- Why is my recovery lower today?
- How has my sleep changed this month?
- What is affecting my HRV?
- How hard have I been training this week?
- What changed compared with my normal baseline?
- Which habits appear correlated with better recovery?
- Should today be a lighter training day?

The AI layer does **not** calculate authoritative health scores.

The intended flow is:

```text
Apple Health / Apple Watch
          ↓
Normalized health data
          ↓
Deterministic analytics
          ↓
Recovery / Sleep / Strain
          ↓
Evidence + confidence
          ↓
On-device AI explanation
          ↓
Human-readable insight
```

This keeps numerical decisions deterministic while using AI where it is strongest: explanation, summarization, and natural-language interaction.

---

# iPhone Experience

The iPhone application is the primary place for deeper analysis.

## Today

A daily overview containing:

- Recovery
- Sleep
- Strain
- Resting heart rate
- HRV
- Steps
- Active calories
- Latest workout
- Data confidence
- Last synchronization time
- Key contributors to today's state

## Trends

Historical analysis across configurable periods such as:

- 7 days
- 30 days
- 90 days
- Longer-term history

Metrics can include:

- HRV
- Resting heart rate
- Sleep duration
- Sleep consistency
- Active energy
- Training load
- Workout frequency
- Recovery
- Strain
- Personal-baseline changes

## Workouts

Workout history and details including:

- Workout type
- Date and time
- Duration
- Active calories
- Distance
- Heart-rate metrics
- Source application/device
- Measurement method
- Notes
- Perceived exertion

## Coach

A privacy-first conversational layer for asking questions about personal health and fitness data.

## Settings

Controls for:

- Health permissions
- Score preferences
- Personal baselines
- AI availability
- Data synchronization
- Local cache rebuild
- Data export
- Privacy
- App preferences

---

# Apple Watch Experience

The Apple Watch app focuses on glanceable information and immediate actions.

## Daily Summary

Quick access to:

- Recovery
- Sleep
- Strain
- Active calories
- Latest health state

## Workout Tracking

Start, monitor, pause, resume, and finish workouts directly from Apple Watch.

## Quick Log

Quickly record contextual factors such as:

- Stress
- Soreness
- Caffeine
- Alcohol
- Late meal
- Mood
- Other journal factors

These can later be correlated with recovery, sleep, and workout trends.

## Complications / Widgets

Planned watchOS complications and widgets can surface:

- Recovery
- Daily readiness
- Latest workout
- Activity summary

---

# Architecture

Atria is designed as a **local-first, modular native Apple-platform application**.

```text
┌──────────────────── Apple Watch ────────────────────┐
│                                                    │
│ Sensors                                            │
│   ↓                                                │
│ HKWorkoutSession                                   │
│ HKLiveWorkoutBuilder                               │
│   ↓                                                │
│ Live workout metrics                               │
│   ↓                                                │
│ Save completed workout to HealthKit                │
│                                                    │
│ Daily summary / Quick Log                          │
└───────────────┬────────────────────────────────────┘
                │
                │ workout mirroring / device sync
                ▼
┌────────────────────── iPhone ──────────────────────┐
│                                                    │
│ HealthKit                                          │
│   ↓                                                │
│ HealthKit synchronization layer                    │
│   ↓                                                │
│ Local persistence / analytics index                │
│   ↓                                                │
│ Aggregation + personal baselines                    │
│   ↓                                                │
│ Recovery / Sleep / Strain engines                  │
│   ↓                                                │
│ Structured health context                          │
│   ↓                                                │
│ On-device AI explanation                           │
│                                                    │
└────────────────────────────────────────────────────┘
```

---

# HealthKit Synchronization Strategy

Atria is intended to use a production-oriented synchronization model rather than repeatedly querying all historical health data.

### Initial synchronization

1. Request only required HealthKit permissions.
2. Backfill a configurable historical period.
3. Normalize supported data types and units.
4. Upsert records using HealthKit object identifiers.
5. Preserve source and device provenance.
6. Calculate affected daily aggregates.
7. Persist synchronization state.

### Incremental synchronization

Atria will use anchored HealthKit queries so it can process:

- New samples
- Updated data
- Deleted HealthKit objects
- Incremental changes since the previous synchronization point

### Reconciliation

The application is designed to additionally support:

- Foreground synchronization
- Recent-history reconciliation
- Cache rebuild
- Timezone changes
- Daylight-saving changes
- Algorithm-version recalculation
- Duplicate prevention

The local database is **not** intended to replace Apple Health.

It serves as a rebuildable analytics index and application cache.

---

# Workout Architecture

Apple Watch workout recording is planned around:

- `HKWorkoutSession`
- `HKLiveWorkoutBuilder`
- `HKLiveWorkoutDataSource`

Active workout state follows an explicit state machine:

```text
idle
  ↓
preparing
  ↓
running
  ↔
paused
  ↓
ending
  ↓
saving
  ↓
completed
```

Failures and interruptions are represented explicitly rather than being hidden behind simple Boolean state.

For supported configurations, HealthKit workout mirroring is intended for live workout coordination between Apple Watch and iPhone.

WatchConnectivity is reserved for appropriate non-workout communication such as:

- Latest dashboard snapshot
- Settings
- Workout templates
- Journal events
- Completed short AI insights

---

# Privacy Philosophy

Atria is designed to be **privacy-first and local-first**.

Core principles:

- HealthKit remains the user's authoritative health store.
- Health information is requested only when required for a feature.
- Core analytics should run locally.
- Health scores are deterministic.
- On-device AI is preferred for health explanations.
- Raw health values should never be written to diagnostic logs.
- Health information is not used for advertising.
- Cloud synchronization of raw health data is not required for core functionality.
- Any future cloud feature should require explicit user consent and clear disclosure.

The application is intended as a **wellness and fitness product**, not a medical diagnostic system.

---

# Technology Stack

## Apple Platforms

| Area | Technology |
|---|---|
| Language | Swift 6 |
| iPhone UI | SwiftUI |
| Apple Watch UI | SwiftUI / watchOS |
| Health data | HealthKit |
| Workout recording | HKWorkoutSession |
| Live workout metrics | HKLiveWorkoutBuilder |
| Workout data source | HKLiveWorkoutDataSource |
| Local persistence | SwiftData |
| Charts | Swift Charts |
| iPhone ↔ Watch state sync | WatchConnectivity |
| Live workout coordination | HealthKit workout mirroring |
| Widgets / complications | WidgetKit |
| Shortcuts / Siri | App Intents |
| Local AI | Foundation Models framework |
| Local ML where needed | Core ML |
| Testing | Swift Testing / XCTest |

## Project & Development Tooling

| Area | Technology |
|---|---|
| Project generation | Tuist |
| Tool version management | mise |
| IDE / AI coding workflow | Cursor |
| Native Apple tooling | Xcode |
| Source control | Git |
| Repository | GitHub |
| Build automation | xcodebuild / Make |
| CI | GitHub Actions (planned) |

---

# Project Structure

Current and planned modules follow a modular architecture.

```text
Atria/
├── Atria/                  # iPhone application
├── AtriaWatch/             # Apple Watch companion
├── AtriaCore/              # Shared domain models and contracts
├── AtriaDesignSystem/      # Shared SwiftUI components
├── AtriaData/              # Local persistence infrastructure
├── AtriaHealth/            # HealthKit infrastructure
├── Config/                 # Build configuration
├── scripts/                # Build/test/development scripts
├── Tuist/                  # Tuist configuration
├── Project.swift
├── Tuist.swift
├── mise.toml
├── AGENTS.md
└── README.md
```

The architecture follows this dependency direction:

```text
SwiftUI View
     ↓
ViewModel
     ↓
Use Case
     ↓
Repository Protocol
     ↓
Infrastructure Implementation
     ↓
HealthKit / SwiftData / WatchConnectivity
```

Views should not directly query HealthKit or persistence.

---

# Current Development Status

Atria is under active development.

### Implemented foundation

- [x] Tuist-generated Xcode workspace
- [x] Native iPhone target
- [x] Native Apple Watch companion target
- [x] Shared domain target
- [x] Shared design-system target
- [x] iOS and watchOS test targets
- [x] Swift 6 configuration
- [x] Strict-concurrency configuration
- [x] Feature-oriented application shell
- [x] Build/test automation scripts
- [x] Local development tooling with mise

### Planned next

- [ ] HealthKit authorization
- [ ] HealthKit synchronization engine
- [ ] SwiftData persistence
- [ ] Workout import
- [ ] Apple Watch workout recording
- [ ] Live heart-rate and calorie tracking
- [ ] Manual workout logging
- [ ] iPhone / Watch state synchronization
- [ ] Recovery scoring
- [ ] Sleep scoring
- [ ] Strain scoring
- [ ] Personal baselines
- [ ] Trend analytics
- [ ] Local AI coach
- [ ] Widgets and watch complications
- [ ] Data export and privacy controls
- [ ] Production device testing
- [ ] TestFlight release

---

# Requirements

- macOS
- Xcode with support for iOS 18+ and watchOS 11+
- [mise](https://mise.jdx.dev)
- Tuist `4.203.4` through the repository's pinned tool configuration

---

# Getting Started

Clone the repository:

```bash
git clone https://github.com/Sujith-Nihar/atria-health-ios.git
cd atria-health-ios
```

Install pinned tools:

```bash
mise install
```

Generate the Xcode workspace:

```bash
make generate
```

Build the iPhone app:

```bash
make build-ios
```

Build the Apple Watch app:

```bash
make build-watch
```

Run tests:

```bash
make test
```

Run the full pre-commit validation:

```bash
make check
```

---

# Development Workflow

Atria uses Conventional Commits.

Examples:

```text
feat(healthkit): add progressive health authorization
feat(sync): add anchored HealthKit synchronization
feat(workouts): add Apple Watch workout recording
feat(scoring): add recovery sleep and strain engines
feat(ai): add local health insight coach
fix(sync): prevent duplicate HealthKit records
test(workouts): cover interrupted workout sessions
docs: document physical-device testing workflow
```

Before committing:

```bash
make check
git status
git diff --check
git add -A
git diff --cached
```

---

# Product Principles

Atria is being built around six principles:

1. **HealthKit is the source of truth**  
   Do not create competing health-data ownership.

2. **Local-first by default**  
   Core health analytics should not require a backend.

3. **Explainable health scoring**  
   Users should understand why a score changed.

4. **AI explains; algorithms decide**  
   LLMs summarize evidence instead of inventing authoritative health metrics.

5. **iPhone and Apple Watch have different jobs**  
   Watch captures and surfaces immediate information; iPhone performs deeper analysis.

6. **Production reliability over demo behavior**  
   Synchronization, idempotency, deletion handling, offline behavior, testing, and privacy are first-class engineering concerns.

---

# Why Atria

The long-term goal is not to create another dashboard full of health numbers.

Atria aims to answer a more useful question:

> **What is my health and training data telling me about how my body is doing today?**

By combining Apple Health data, Apple Watch workouts, personal baselines, deterministic analytics, and privacy-preserving AI, Atria aims to make personal health information easier to understand and more actionable.

---

# Disclaimer

Atria is intended for general wellness and fitness purposes.

It is not designed to diagnose, treat, cure, or prevent medical conditions and should not be used as a substitute for professional medical advice.

---

# License

A license has not yet been selected.
