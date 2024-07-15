import Foundation

extension AboutApp {
	/**
	 The app version.

	 The version is read from the global constant VERSION.
	 */
	public var version: String? {
		Self.getAppVersionFrom(bundle: self.bundle)
	}

	/**
	 Retrieve the app version from the app's bundle.

	 Concatenates the normal version and the short version into one string.

	 - Returns: The app version or nil.
	 */
	static func getAppVersionFrom(bundle: InfoDictReaderProtocol) -> String? {
		let objectFor = bundle.object(forInfoDictionaryKey:)
		var version: [String] = []

		if let releaseVersion = objectFor("CFBundleShortVersionString") as? String {
			version.append("Release: \(releaseVersion)")
		}

		if let buildVersion = objectFor(kCFBundleVersionKey as String) as? String {
			version.append("Build: \(buildVersion)")
		}

		return version.count > 0 ? version.joined(separator: " ") : nil
	}
}
