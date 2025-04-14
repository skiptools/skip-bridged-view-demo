// Copyright 2024–2025 Skip
// SPDX-License-Identifier: LGPL-3.0-only WITH LGPL-3.0-linking-exception
import Foundation
#if !SKIP_BRIDGE
#if !SKIP
import SwiftUI

/// Example of a view that can be used in a native `SkipFuseUI` app.
public struct SkipBridgedDemoView : View {
    public init() {
    }

    public var body: some View {
        Text(verbatim: "💙 Hello Darwin!")
    }
}
#endif
#endif

#if SKIP_BRIDGE
import SkipFuseUI

public struct SkipBridgedDemoView : View {
    public init() {
    }

    public var body: some View {
        ComposeView {
            DemoComposer()
        }
    }
}
#endif

#if SKIP
import SkipUI

/// Use a ContentComposer to integrate Compose content. This code will be transpiled to Kotlin.
struct DemoComposer : ContentComposer {
    @Composable func Compose(context: ComposeContext) {
        androidx.compose.material3.Text("💚 Hello Android!", modifier: context.modifier)
    }
}
#endif
