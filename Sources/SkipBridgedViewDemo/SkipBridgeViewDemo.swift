// Copyright 2024–2025 Skip
// SPDX-License-Identifier: LGPL-3.0-only WITH LGPL-3.0-linking-exception
#if !SKIP_BRIDGE
import Foundation
#if canImport(SkipFuseUI)
import SkipFuseUI
#else
import SwiftUI
#endif

/// Example of a view that can be used in a native `SkipFuseUI` app.
public struct SkipBridgedDemoView : View {
    public init() {
    }

    public var body: some View {
        #if SKIP
//        ComposeView {
//            HeartComposer()
//        }
        ComposeView { ctx in // Mix in Compose code!
            androidx.compose.material3.Text("💚", modifier: ctx.modifier)
        }
        #else
        Text(verbatim: "💙 Hello Darwin!")
        #endif
    }
}


//#if SKIP
///// Use a ContentComposer to integrate Compose content. This code will be transpiled to Kotlin.
//struct HeartComposer : ContentComposer {
//    @Composable func Compose(context: ComposeContext) {
//        androidx.compose.material3.Text("💚 Hello Android!", modifier: context.modifier)
//    }
//}
//#endif

#endif
