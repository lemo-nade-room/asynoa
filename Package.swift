// swift-tools-version: 6.3
import PackageDescription

let package = Package(
  name: "asynoa",
  platforms: [.macOS(.v26)],
  targets: [
    .executableTarget(name: "Asynoa"),

    .target(name: "Core"),
    .testTarget(
      name: "CoreTests",
      dependencies: [.target(name: "Core")],
      swiftSettings: swiftSettings,
    ),
  ],
  swiftLanguageModes: [.v6],
)

var swiftSettings: [SwiftSetting] {
  [
    .enableUpcomingFeature("ExistentialAny"),
    .enableUpcomingFeature("InternalImportsByDefault"),
    .enableUpcomingFeature("MemberImportVisibility"),
    .enableUpcomingFeature("InferIsolatedConformances"),
    .enableUpcomingFeature("NonisolatedNonsendingByDefault"),
    .enableUpcomingFeature("ImmutableWeakCaptures"),
  ]
}
