// Copyright 2024–2025 Skip
// SPDX-License-Identifier: LGPL-3.0-only WITH LGPL-3.0-linking-exception
import Foundation
#if canImport(SkipFuseUI)
import SkipFuseUI
#else
import SwiftUI
#endif

/// A view that shows a blue heart on iOS and a green heart on Android.
public struct SkipBridgedDemoView : View {
    public init() {
    }

    public var body: some View {
        #if os(Android)
        ComposeView {
            DemoComposer()
        }
        #else
        Text(verbatim: "💙 Hello Darwin!")
        #endif
    }
}

#if SKIP
import SkipUI

/// Use a ContentComposer to integrate Compose content. This code will be transpiled to Kotlin.
struct DemoComposer : ContentComposer {
    @Composable func Compose(context: ComposeContext) {
        androidx.compose.material3.Text("💚 Hello Android!", modifier: context.modifier)
    }
}
#endif
