import Foundation

extension Bundle {
	/**
	 Retrieve the bundle name.

	 Try the display version first and the short name second.

	 - Returns: The bundle name or nil.
	 */
	public var name: String? {
		AboutApp.getAppNameFrom(bundle: self)
	}
}
