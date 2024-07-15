import AppKit

extension AboutApp {
	/**
	 The app icon.

	 The binary name is derived from arg0.
	 */
	public var icon: NSImage? {
		NSApplication.shared.applicationIconImage
	}
}
