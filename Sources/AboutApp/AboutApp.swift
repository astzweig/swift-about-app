
import Foundation

public struct AboutApp {
	private static var instance: AboutApp? = nil
	public static var shared: AboutApp {
		if let instance = Self.instance {
			return instance
		}

		let instance = Self()
		Self.instance = instance
		return instance
	}
}
