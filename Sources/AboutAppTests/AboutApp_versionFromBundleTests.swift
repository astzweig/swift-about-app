import XCTest
@testable import AboutApp

fileprivate let bundleVersion = "1.0.17d33"
fileprivate let bundleShortVersion = "1.0.0"

fileprivate struct ExistingBundleWithShortAndLongVersion: InfoDictReaderProtocol {
	func object(forInfoDictionaryKey key: String) -> Any? {
		if key == kCFBundleVersionKey as String {
			return bundleVersion
		}
		if key == "CFBundleShortVersionString" {
			return bundleShortVersion
		}
		return nil
	}
}

fileprivate struct ExistingBundleWithLongVersionOnly: InfoDictReaderProtocol {
	func object(forInfoDictionaryKey key: String) -> Any? {
		if key == kCFBundleVersionKey as String {
			return bundleVersion
		}
		return nil
	}
}

fileprivate struct NonExistingBundle: InfoDictReaderProtocol {
	func object(forInfoDictionaryKey: String) -> Any? {
		return nil
	}
}

final class AboutApp_versionFromBundleTests: XCTestCase {
	func testReturnsNilIfNotInABundle() {
		let bundle = NonExistingBundle()
		XCTAssertNil(AboutApp.init(bundle: bundle).version)
	}

	func testReturnsBuildVersionIfNoReleaseVersionIsSpecified() {
		let bundle = ExistingBundleWithLongVersionOnly()
		XCTAssertEqual("Build: \(bundleVersion)", AboutApp.init(bundle: bundle).version)
	}

	func testReturnsBuildAndReleaseVersionIfSpecified() {
		let bundle = ExistingBundleWithShortAndLongVersion()
		XCTAssertEqual("Release: \(bundleShortVersion) Build: \(bundleVersion)", AboutApp.init(bundle: bundle).version)
	}
}
