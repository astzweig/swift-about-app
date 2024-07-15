import Foundation

extension AboutApp {
	/**
	 The app name.

	 The app name is derived from arg0.
	 */
	public var appName: String? {
		Self.getAppName()
	}

	private static func getAppName() -> String? {
		let appName = Self.getAppNameFromArg0()
		return appName
	}

	/**
	 Retrieve the app name using the executable name.

	 Retrieve the last path component of arg0.

	 - Returns: The app name of the executable or nil.
	 */
	private static func getAppNameFromArg0() -> String? {
		guard CommandLine.argc > 0 else { return nil }
		guard let binaryPath = URL(string: CommandLine.arguments[0]),
			  !binaryPath.lastPathComponent.isEmpty,
			  !binaryPath.lastPathComponent.starts(with: "/", by: ==)
		else { return nil }
		return binaryPath.lastPathComponent
	}
}
