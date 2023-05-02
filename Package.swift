// swift-tools-version: 5.7
import PackageDescription

let version = "4.7.0"

let package = Package(
    name: "OpenCV2",
    platforms: [
        .macOS(.v12), .iOS(.v15)
    ],
    products: [
        .library(
            name: "OpenCV2",
            targets: ["OpenCV2", "opencv2-dependencies"]
        ),
    ],
    targets: [
        .binaryTarget(
            name: "OpenCV2",
            url: "https://archive.wdkk.co.jp/opencv/\(version)/opencv2.xcframework.zip",
            checksum: "e9605b0911f8087cde520106baf27d3ab9b70b30b5803bfbc729dacfa8cfedd0"
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