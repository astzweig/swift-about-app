import Foundation

protocol InfoDictReaderProtocol {
	func object(forInfoDictionaryKey: String) -> Any?
}

extension Bundle: InfoDictReaderProtocol {
}
