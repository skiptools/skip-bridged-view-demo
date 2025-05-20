#if !SKIP_BRIDGE
import Foundation
import OSLog
import SwiftUI
#if SKIP
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
#endif

let logger: Logger = Logger(subsystem: "skip.bridge.view.demo", category: "SkipBridgedDemoView")

/// A view that shows a blue heart on iOS and a green heart on Android.
public struct SkipBridgedDemoView : View {
    public let greeting: String

    public init(greeting: String = "Hello") {
        self.greeting = greeting
    }

    #if !SKIP
    public var body: some View {
        Text(verbatim: "💙 \(greeting) Darwin!")
    }
    #else
    // SKIP @nobridge
    @Composable override func ComposeContent(context: ComposeContext) {
        ComposeContainer(modifier: context.modifier) { modifier in
            androidx.compose.material3.Text("💚 \(greeting) Android!", modifier: context.modifier)
        }
    }
    #endif
}
#endif
