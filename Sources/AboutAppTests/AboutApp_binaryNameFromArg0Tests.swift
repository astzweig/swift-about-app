import XCTest
@testable import AboutApp

final class AboutApp_binaryNameFromArg0Tests: XCTestCase {
    func testGetsAppNameFromArg0() {
		CommandLine.arguments = ["/some/path/to/app"]
		XCTAssertEqual("app", AboutApp.shared.binaryName)
    }

	func testReturnsNilForEmptyArg0() {
		CommandLine.arguments = [""]
		XCTAssertEqual(nil, AboutApp.shared.binaryName)
	}

	func testReturnsNilForArg0WithoutBasename() {
		CommandLine.arguments = ["/"]
		XCTAssertEqual(nil, AboutApp.shared.binaryName)
	}
}
