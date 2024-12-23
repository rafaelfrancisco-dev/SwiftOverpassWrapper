// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "SwiftOverpassWrapper",
    products: [
        .library(name: "SwiftOverpassWrapper", targets: ["SwiftOverpassWrapper"]),
    ],
    dependencies: [
        .package(url: "https://github.com/tadija/AEXML.git", from: "4.7.0"),
        .package(url: "https://github.com/Alamofire/Alamofire.git", from: "5.10.2")
    ],
    targets: [
        .target(
            name: "SwiftOverpassWrapper",
            dependencies: ["AEXML", "Alamofire"]
        ),
        .testTarget(
            name: "SwiftOverpassTests",
            dependencies: ["SwiftOverpassWrapper"]),
    ]
)
