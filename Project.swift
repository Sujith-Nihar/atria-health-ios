import ProjectDescription

let project = Project(
    name: "Atria",
    targets: [
        .target(
            name: "Atria",
            destinations: .iOS,
            product: .app,
            bundleId: "dev.tuist.Atria",
            infoPlist: .extendingDefault(
                with: [
                    "UILaunchScreen": [
                        "UIColorName": "",
                        "UIImageName": "",
                    ],
                ]
            ),
            buildableFolders: [
                "Atria/Sources",
                "Atria/Resources",
            ],
            dependencies: []
        ),
        .target(
            name: "AtriaTests",
            destinations: .iOS,
            product: .unitTests,
            bundleId: "dev.tuist.AtriaTests",
            infoPlist: .default,
            buildableFolders: [
                "Atria/Tests"
            ],
            dependencies: [.target(name: "Atria")]
        ),
    ]
)
