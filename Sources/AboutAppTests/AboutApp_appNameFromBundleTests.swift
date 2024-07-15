import XCTest
@testable import AboutApp

fileprivate let bundleDisplayName = "Some App"
fileprivate let bundleName = "some-app"

fileprivate struct ExistingBundleWithDisplayName: InfoDictReaderProtocol {
	func object(forInfoDictionaryKey key: String) -> Any? {
		if key == kCFBundleNameKey as String {
			return bundleName
		}
		if key == "CFBundleDisplayName" {
			return bundleDisplayName
		}
		return nil
	}
}

fileprivate struct ExistingBundleWithoutDisplayName: InfoDictReaderProtocol {
	func object(forInfoDictionaryKey key: String) -> Any? {
		if key == kCFBundleNameKey as String {
			return bundleName
		}
		return nil
	}
}

fileprivate struct NonExistingBundle: InfoDictReaderProtocol {
	func object(forInfoDictionaryKey: String) -> Any? {
		return nil
	}
}

final class AboutApp_appNameFromBundleTests: XCTestCase {
	func testReturnsNilIfBinaryNameIsNilAndIfNotInABundle() {
		CommandLine.arguments = ["/"]
		let bundle = NonExistingBundle()
		XCTAssertNil(AboutApp(bundle: bundle).appName)
	}

	func testReturnsBinaryNameIfNotInABundle() {
		CommandLine.arguments = ["/some/path/to/app"]
		let bundle = NonExistingBundle()
		XCTAssertEqual("app", AboutApp(bundle: bundle).appName)
	}

	func testGetsBundleNameIfBundleHasOne() {
		let bundle = ExistingBundleWithoutDisplayName()
		XCTAssertEqual(bundleName, AboutApp(bundle: bundle).appName)
	}

	func testGetsDisplayNameIfBundleHasOne() {
		let bundle = ExistingBundleWithDisplayName()
		XCTAssertEqual(bundleDisplayName, AboutApp(bundle: bundle).appName)
	}
}
