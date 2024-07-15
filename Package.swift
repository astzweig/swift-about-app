// swift-tools-version: 5.7
import PackageDescription

let package = Package(
    name: "swift-about-app",
    products: [
		.library(name: "AboutApp", targets: ["AboutApp"])
    ],
    targets: [
        .target(name: "AboutApp"),
		.testTarget(
			name: "AboutAppTests",
			dependencies: ["AboutApp"]
		)
    ]
)
