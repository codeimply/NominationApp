// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "NominationsKit",
    platforms: [.iOS(.v16)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "NominationsKit",
            targets: ["NominationsKit"]),
    ],
    dependencies: [
        .package(url: "https://github.com/Alamofire/Alamofire.git", .upToNextMajor(from: "5.8.1"))
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "NominationsKit"),
        .testTarget(
            name: "NominationsKitTests",
            dependencies: ["NominationsKit"]),
    ]
)

/* Adding packages ensures easier maintenance, promote modularity, and encourage reusability. In addition, enables to share code across projects and with other developers. */
