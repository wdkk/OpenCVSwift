// swift-tools-version: 5.7
import PackageDescription

let version = "4.7.0"

let package = Package(
    name: "opencv2",
    platforms: [
        .macOS(.v12), .iOS(.v15)
    ],
    products: [
        .library(
            name: "opencv2",
            targets: ["opencv2", "opencv2-dependencies"]
        ),
    ],
    targets: [
        .binaryTarget(
            name: "opencv2",
            url: "https://archive.wdkk.co.jp/opencv/\(version)/opencv2.xcframework.zip",
            checksum: "05d8b272b416ebb35ffaa16e58d20e75c04d7bb1c506cf7188e710a7de55ba13"
        ),
        .target(
            name: "opencv2-dependencies",
            linkerSettings: [
                .linkedFramework("AVFoundation"),
                .linkedFramework("CoreImage"),
                .linkedFramework("CoreMedia"),
                .linkedFramework("CoreVideo", .when(platforms: [.iOS])),
                .linkedFramework("Accelerate", .when(platforms: [.iOS, .macOS])),
                .linkedFramework("OpenCL", .when(platforms: [.macOS])),
                .linkedLibrary("c++")
            ]
        )
    ]
)