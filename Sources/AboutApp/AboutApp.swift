import Foundation

public struct AboutApp {
	let bundle: InfoDictReaderProtocol
	private static var instance: AboutApp? = nil
	public static var shared: AboutApp {
		if let instance = Self.instance {
			return instance
		}

		let instance = Self(bundle: Bundle.main)
		Self.instance = instance
		return instance
	}

	init(bundle: InfoDictReaderProtocol) {
		self.bundle = bundle
	}
}
