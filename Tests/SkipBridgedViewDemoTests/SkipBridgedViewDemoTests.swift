import XCTest
import OSLog
import Foundation
@testable import SkipBridgedViewDemo

let logger: Logger = Logger(subsystem: "test", category: "SkipBridgedViewDemoTests")

final class SkipBridgedViewDemoTests: XCTestCase {
    public func testSkipBridgedViewDemo() {
        let view = SkipBridgedDemoView()
    }
}
