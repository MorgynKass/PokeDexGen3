//
//  PokeDex3WidgetLiveActivity.swift
//  PokeDex3Widget
//
//  Created by Morgyn Peay on 7/3/24.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct PokeDex3WidgetAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var emoji: String
    }

    // Fixed non-changing properties about your activity go here!
    var name: String
}

struct PokeDex3WidgetLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: PokeDex3WidgetAttributes.self) { context in
            // Lock screen/banner UI goes here
            VStack {
                Text("Hello \(context.state.emoji)")
            }
            .activityBackgroundTint(Color.cyan)
            .activitySystemActionForegroundColor(Color.black)

        } dynamicIsland: { context in
            DynamicIsland {
                // Expanded UI goes here.  Compose the expanded UI through
                // various regions, like leading/trailing/center/bottom
                DynamicIslandExpandedRegion(.leading) {
                    Text("Leading")
                }
                DynamicIslandExpandedRegion(.trailing) {
                    Text("Trailing")
                }
                DynamicIslandExpandedRegion(.bottom) {
                    Text("Bottom \(context.state.emoji)")
                    // more content
                }
            } compactLeading: {
                Text("L")
            } compactTrailing: {
                Text("T \(context.state.emoji)")
            } minimal: {
                Text(context.state.emoji)
            }
            .widgetURL(URL(string: "http://www.apple.com"))
            .keylineTint(Color.red)
        }
    }
}

extension PokeDex3WidgetAttributes {
    fileprivate static var preview: PokeDex3WidgetAttributes {
        PokeDex3WidgetAttributes(name: "World")
    }
}

extension PokeDex3WidgetAttributes.ContentState {
    fileprivate static var smiley: PokeDex3WidgetAttributes.ContentState {
        PokeDex3WidgetAttributes.ContentState(emoji: "😀")
     }
     
     fileprivate static var starEyes: PokeDex3WidgetAttributes.ContentState {
         PokeDex3WidgetAttributes.ContentState(emoji: "🤩")
     }
}

#Preview("Notification", as: .content, using: PokeDex3WidgetAttributes.preview) {
   PokeDex3WidgetLiveActivity()
} contentStates: {
    PokeDex3WidgetAttributes.ContentState.smiley
    PokeDex3WidgetAttributes.ContentState.starEyes
}
