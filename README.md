# AboutApp

AboutApp is a library to retrieve information about the application during
runtime, e.g. the app name or the app version.

## Usage
Use AboutApp:

```swift
import AboutApp

@main
struct YourApp {
	public static func main() {
		let appName = AboutApp.shared.appName
		print("Application name is \(appName)")
	}
}
```

## Documentation
The library has enriched symbol documentation for [DocC].

[DocC]: https://www.swift.org/documentation/docc/documenting-a-swift-framework-or-package

## Changelog

This project keeps a [changelog](CHANGELOG.md) that adheres to
[Keep a Changelog](https://keepachangelog.com/en/1.1.0/).

## Testing `AboutApp`
AboutApp includes a test target that can be run by

```sh
$ swift test
```

in the package folder or perform the Test action in Xcode (<kbd>⌃⌥⌘U</kbd>).

## Adding AboutApp as a Dependency

To use the AboutApp library in a project, add it to the dependencies of the
package:

```swift
let package = Package(
	// name, platforms, products, etc.
	dependencies: [
		// other dependencies
		.package(url: "https://github.com/astzweig/swift-about-app", from: "0.1.0"),
	],
	targets: [
		.executableTarget(name: "<command-line-tool>", dependencies: [
			// other dependencies
			.product(name: "AboutApp", package: "swift-about-app"),
		]),
		// other targets
	]
)
```

### Supported Versions

The minimum Swift version supported by swift-about-app releases are detailed below:

swift-about-app            | Minimum Swift Version
---------------------------|----------------------
`0.0.1 ...`                | 5.7
