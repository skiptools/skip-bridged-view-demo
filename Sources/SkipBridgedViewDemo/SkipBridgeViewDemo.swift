// Copyright 2024–2025 Skip
import Foundation
#if SKIP_BRIDGE
import SkipFuseUI
#else
#if canImport(OSLog)
import OSLog
#endif
#if canImport(SkipFuseUI) || SKIP
import SkipFuseUI
#else
import SwiftUI
#endif
#endif // SKIP_BRIDGE

//let logger: Logger = Logger(subsystem: "skip.bridge.view.demo", category: "SkipBridgedDemoView")

/// A view that shows a blue heart on iOS and a green heart on Android.
public struct SkipBridgedDemoView : View {
    public init() {
    }

    public var body: some View {
        #if SKIP_BRIDGE && os(Android)
        ComposeView {
            DemoComposer()
        }
        #else
        Text(verbatim: "💙 Hello Darwin!")
        #endif
    }
}

#if SKIP
/// Use a ContentComposer to integrate Compose content. This code will be transpiled to Kotlin.
struct DemoComposer : ContentComposer {
    @Composable func Compose(context: ComposeContext) {
        androidx.compose.material3.Text("💚 Hello Android!", modifier: context.modifier)
    }
}
#endif
