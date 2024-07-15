import Foundation

extension Bundle {
	/**
	 Retrieve the bundle version.

	 Concatenates the normal version and the short version into one string.

	 - Returns: The app version or nil.
	 */
	public var version: String? {
		AboutApp.getAppVersionFrom(bundle: self)
	}
}
