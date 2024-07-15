import XCTest
@testable import AboutApp

final class AboutApp_appNameFromArg0Tests: XCTestCase {
    func testGetsAppNameFromArg0() {
		CommandLine.arguments = ["/some/path/to/app"]
		XCTAssertEqual("app", AboutApp.shared.appName)
    }

	func testReturnsNilForEmptyArg0() {
		CommandLine.arguments = [""]
		XCTAssertEqual(nil, AboutApp.shared.appName)
	}

	func testReturnsNilForArg0WithoutBasename() {
		CommandLine.arguments = ["/"]
		XCTAssertEqual(nil, AboutApp.shared.appName)
	}
}
