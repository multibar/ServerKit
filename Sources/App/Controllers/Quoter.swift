import Jobs
import Vapor
import CoreKit
import Foundation

public final class Quoter {
    public func initialize() {}
    public init() {
        setup()
    }
    private func setup() {
        Jobs.add(interval: .seconds(1)) {
            print(Core.Manager.shared.session)
        }
    }
}
extension Application {
    public var quoter: Quoter {
        get {
            if let quoter = self.storage[Quoter.Key.self] {
                return quoter
            } else {
                let quoter = Quoter()
                self.storage[Quoter.Key.self] = quoter
                return quoter
            }
        }
        set {
            self.storage[Quoter.Key.self] = newValue
        }
    }
}
extension Quoter {
    fileprivate struct Key: StorageKey {
        typealias Value = Quoter
    }
}
