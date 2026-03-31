// Copyright 2023–2026 Skip
// SPDX-License-Identifier: MPL-2.0
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
