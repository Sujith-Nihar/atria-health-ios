import ProjectDescription

private let iOSDeployment: DeploymentTargets = .iOS("18.0")
private let watchDeployment: DeploymentTargets = .watchOS("11.0")
private let multiDeployment: DeploymentTargets = .multiplatform(
    iOS: "18.0",
    watchOS: "11.0"
)

private let projectSettings: Settings = .settings(
    base: [
        "SWIFT_VERSION": "6.0",
        "SWIFT_STRICT_CONCURRENCY": "complete",
    ],
    configurations: [
        .debug(name: "Debug", xcconfig: "Config/Debug.xcconfig"),
        .release(name: "Release", xcconfig: "Config/Release.xcconfig"),
    ],
    defaultSettings: .recommended
)

let project = Project(
    name: "Atria",
    settings: projectSettings,
    targets: [
        .target(
            name: "AtriaCore",
            destinations: [.iPhone, .appleWatch],
            product: .staticFramework,
            bundleId: "com.sujiththota.atria.core",
            deploymentTargets: multiDeployment,
            sources: ["AtriaCore/Sources/**"],
            dependencies: []
        ),
        .target(
            name: "AtriaDesignSystem",
            destinations: [.iPhone, .appleWatch],
            product: .staticFramework,
            bundleId: "com.sujiththota.atria.designsystem",
            deploymentTargets: multiDeployment,
            sources: ["AtriaDesignSystem/Sources/**"],
            dependencies: [
                .target(name: "AtriaCore"),
            ]
        ),
        .target(
            name: "Atria",
            destinations: [.iPhone],
            product: .app,
            bundleId: "com.sujiththota.atria",
            deploymentTargets: iOSDeployment,
            infoPlist: .extendingDefault(
                with: [
                    "CFBundleDisplayName": "Atria",
                    "UILaunchScreen": [
                        "UIColorName": "",
                        "UIImageName": "",
                    ],
                ]
            ),
            sources: ["Atria/Sources/**"],
            resources: ["Atria/Resources/**"],
            dependencies: [
                .target(name: "AtriaCore"),
                .target(name: "AtriaDesignSystem"),
                .target(name: "AtriaWatch"),
            ]
        ),
        .target(
            name: "AtriaWatch",
            destinations: [.appleWatch],
            product: .app,
            bundleId: "com.sujiththota.atria.watchapp",
            deploymentTargets: watchDeployment,
            infoPlist: .extendingDefault(
                with: [
                    "CFBundleDisplayName": "Atria",
                    "WKApplication": true,
                    "WKCompanionAppBundleIdentifier": "com.sujiththota.atria",
                    "WKRunsIndependentlyOfCompanionApp": false,
                ]
            ),
            sources: ["AtriaWatch/Sources/**"],
            resources: ["AtriaWatch/Resources/**"],
            dependencies: [
                .target(name: "AtriaCore"),
                .target(name: "AtriaDesignSystem"),
            ]
        ),
        .target(
            name: "AtriaTests",
            destinations: [.iPhone],
            product: .unitTests,
            bundleId: "com.sujiththota.atria.tests",
            deploymentTargets: iOSDeployment,
            sources: ["Atria/Tests/**"],
            dependencies: [
                .target(name: "Atria"),
                .target(name: "AtriaCore"),
            ]
        ),
        .target(
            name: "AtriaWatchTests",
            destinations: [.appleWatch],
            product: .unitTests,
            bundleId: "com.sujiththota.atria.watchtests",
            deploymentTargets: watchDeployment,
            sources: ["AtriaWatch/Tests/**"],
            dependencies: [
                .target(name: "AtriaWatch"),
                .target(name: "AtriaCore"),
            ]
        ),
    ]
)
