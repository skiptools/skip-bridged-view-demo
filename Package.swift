// swift-tools-version: 5.9
// This is a Skip (https://skip.tools) package,
// containing a Swift Package Manager project
// that will use the Skip build plugin to transpile the
// Swift Package, Sources, and Tests into an
// Android Gradle Project with Kotlin sources and JUnit tests.
import PackageDescription
import Foundation

let package = Package(
    name: "skip-bridged-view-demo",
    defaultLocalization: "en",
    platforms: [.iOS(.v16), .macOS(.v13), .tvOS(.v16), .watchOS(.v9), .macCatalyst(.v16)],
    products: [
        .library(name: "SkipBridgedViewDemo", targets: ["SkipBridgedViewDemo"]),
    ],
    dependencies: [
        .package(url: "https://source.skip.tools/skip.git", from: "1.2.1"),
        .package(url: "https://source.skip.tools/skip-fuse-ui.git", "0.0.0"..<"2.0.0")
        //.package(url: "https://source.skip.tools/skip-fuse-ui.git", branch: "main")
    ],
    targets: [
        .target(name: "SkipBridgedViewDemo", dependencies: [
            .product(name: "SkipFuseUI", package: "skip-fuse-ui")
        ], plugins: [.plugin(name: "skipstone", package: "skip")]),
        .testTarget(name: "SkipBridgedViewDemoTests", dependencies: ["SkipBridgedViewDemo", .product(name: "SkipTest", package: "skip")], plugins: [.plugin(name: "skipstone", package: "skip")]),
    ]
)

if ProcessInfo.processInfo.environment["SKIP_BRIDGE"] ?? "0" != "0" {
//    package.dependencies += [.package(url: "https://source.skip.tools/skip-fuse-ui.git", "0.0.0"..<"2.0.0")]
//    package.targets.forEach({ target in
//        target.dependencies += [.product(name: "SkipFuseUI", package: "skip-fuse-ui")]
//    })
    // all library types must be dynamic to support bridging
    package.products = package.products.map({ product in
        guard let libraryProduct = product as? Product.Library else { return product }
        return .library(name: libraryProduct.name, type: .dynamic, targets: libraryProduct.targets)
    })
}
