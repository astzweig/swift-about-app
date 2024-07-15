import Foundation

extension AboutApp {
	/**
	 The binary name.

	 The binary name is derived from arg0.
	 */
	public var binaryName: String? {
		Self.getBinaryNameFromArg0()
	}

	/**
	 The app name.

	 The app name is either read from the bundle or derived from arg0.
	 */
	public var appName: String? {
		self.getAppName()
	}

	private func getAppName() -> String? {
		var appName = Self.getAppNameFrom(bundle: self.bundle)
		if (appName == nil) {
			appName = Self.getBinaryNameFromArg0()
		}
		return appName
	}

	/**
	 Retrieve the app name from the app's bundle.

	 Try the display version first and the short name second.

	 - Returns: The app name or nil.
	 */
	private static func getAppNameFrom(bundle: InfoDictReaderProtocol) -> String? {
		for dictionaryKey in ["CFBundleDisplayName", kCFBundleNameKey as String] {
			if let appName = bundle.object(forInfoDictionaryKey: dictionaryKey) as? String {
				return appName
			}
		}
		return nil
	}

	/**
	 Retrieve the app name using the executable name.

	 Retrieve the last path component of arg0.

	 - Returns: The app name of the executable or nil.
	 */
	private static func getBinaryNameFromArg0() -> String? {
		guard CommandLine.argc > 0 else { return nil }
		guard let binaryPath = URL(string: CommandLine.arguments[0]),
			  !binaryPath.lastPathComponent.isEmpty,
			  !binaryPath.lastPathComponent.starts(with: "/", by: ==)
		else { return nil }
		return binaryPath.lastPathComponent
	}
}
