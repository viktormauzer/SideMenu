//
//  Message.swift
//  SideMenu
//
//  Created by Viktor Mauzer on 05.08.2022..
//

import Foundation

struct Message: Identifiable {
    var id: UUID
    var sender: String
    var title: String
    var body: String
    
    var description: String {
        body.trunc(length: 100, trailing: "...")
    }
    
    var avatarLetter: String {
        if let sender = sender.first {
            return sender.uppercased()
        }
        return ""
    }
}

#if DEBUG

extension Message {
    static func mockData() -> [Message] {
        [
            Message(id: UUID(), sender: "James Jones", title: "Hello friend", body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc tellus nulla, tristique nec venenatis ac, consequat vitae turpis. Nullam pharetra tincidunt efficitur. Nam sollicitudin dictum consequat. Cras facilisis lorem in viverra dignissim. Pellentesque vitae placerat odio. In hac habitasse platea dictumst. Mauris iaculis nisi sed interdum rhoncus. Duis sit amet mollis neque. Quisque vestibulum pulvinar tellus, a facilisis lorem gravida quis. In ut maximus nisi. Aliquam facilisis bibendum libero vitae dignissim. Nam tempor quam a feugiat tincidunt. Nullam scelerisque augue eget nunc vehicula semper. Nam maximus nibh mauris, at sodales turpis sodales nec. Praesent sollicitudin urna purus, sit amet volutpat ante efficitur in. Suspendisse justo enim, dapibus ut nibh in, maximus sodales ipsum. Sed feugiat maximus nisi sit amet consectetur."),
            Message(id: UUID(), sender: "Dana Scully", title: "What is going on???", body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc tellus nulla, tristique nec venenatis ac, consequat vitae turpis. Nullam pharetra tincidunt efficitur. Nam sollicitudin dictum consequat. Cras facilisis lorem in viverra dignissim. Pellentesque vitae placerat odio. In hac habitasse platea dictumst. Mauris iaculis nisi sed interdum rhoncus. Duis sit amet mollis neque. Quisque vestibulum pulvinar tellus, a facilisis lorem gravida quis. In ut maximus nisi. Aliquam facilisis bibendum libero vitae dignissim. Nam tempor quam a feugiat tincidunt. Nullam scelerisque augue eget nunc vehicula semper. Nam maximus nibh mauris, at sodales turpis sodales nec. Praesent sollicitudin urna purus, sit amet volutpat ante efficitur in. Suspendisse justo enim, dapibus ut nibh in, maximus sodales ipsum. Sed feugiat maximus nisi sit amet consectetur."),
            Message(id: UUID(), sender: "Fox Mulder", title: "The truth is out there", body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc tellus nulla, tristique nec venenatis ac, consequat vitae turpis. Nullam pharetra tincidunt efficitur. Nam sollicitudin dictum consequat. Cras facilisis lorem in viverra dignissim. Pellentesque vitae placerat odio. In hac habitasse platea dictumst. Mauris iaculis nisi sed interdum rhoncus. Duis sit amet mollis neque. Quisque vestibulum pulvinar tellus, a facilisis lorem gravida quis. In ut maximus nisi. Aliquam facilisis bibendum libero vitae dignissim. Nam tempor quam a feugiat tincidunt. Nullam scelerisque augue eget nunc vehicula semper. Nam maximus nibh mauris, at sodales turpis sodales nec. Praesent sollicitudin urna purus, sit amet volutpat ante efficitur in. Suspendisse justo enim, dapibus ut nibh in, maximus sodales ipsum. Sed feugiat maximus nisi sit amet consectetur."),
            Message(id: UUID(), sender: "Dean Winchester", title: "Saaaaaaaam!!", body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc tellus nulla, tristique nec venenatis ac, consequat vitae turpis. Nullam pharetra tincidunt efficitur. Nam sollicitudin dictum consequat. Cras facilisis lorem in viverra dignissim. Pellentesque vitae placerat odio. In hac habitasse platea dictumst. Mauris iaculis nisi sed interdum rhoncus. Duis sit amet mollis neque. Quisque vestibulum pulvinar tellus, a facilisis lorem gravida quis. In ut maximus nisi. Aliquam facilisis bibendum libero vitae dignissim. Nam tempor quam a feugiat tincidunt. Nullam scelerisque augue eget nunc vehicula semper. Nam maximus nibh mauris, at sodales turpis sodales nec. Praesent sollicitudin urna purus, sit amet volutpat ante efficitur in. Suspendisse justo enim, dapibus ut nibh in, maximus sodales ipsum. Sed feugiat maximus nisi sit amet consectetur."),
            Message(id: UUID(), sender: "Sam Winchester", title: "Really, I am ok", body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc tellus nulla, tristique nec venenatis ac, consequat vitae turpis. Nullam pharetra tincidunt efficitur. Nam sollicitudin dictum consequat. Cras facilisis lorem in viverra dignissim. Pellentesque vitae placerat odio. In hac habitasse platea dictumst. Mauris iaculis nisi sed interdum rhoncus. Duis sit amet mollis neque. Quisque vestibulum pulvinar tellus, a facilisis lorem gravida quis. In ut maximus nisi. Aliquam facilisis bibendum libero vitae dignissim. Nam tempor quam a feugiat tincidunt. Nullam scelerisque augue eget nunc vehicula semper. Nam maximus nibh mauris, at sodales turpis sodales nec. Praesent sollicitudin urna purus, sit amet volutpat ante efficitur in. Suspendisse justo enim, dapibus ut nibh in, maximus sodales ipsum. Sed feugiat maximus nisi sit amet consectetur."),
            Message(id: UUID(), sender: "Peter Bishop", title: "I'm done with this!", body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc tellus nulla, tristique nec venenatis ac, consequat vitae turpis. Nullam pharetra tincidunt efficitur. Nam sollicitudin dictum consequat. Cras facilisis lorem in viverra dignissim. Pellentesque vitae placerat odio. In hac habitasse platea dictumst. Mauris iaculis nisi sed interdum rhoncus. Duis sit amet mollis neque. Quisque vestibulum pulvinar tellus, a facilisis lorem gravida quis. In ut maximus nisi. Aliquam facilisis bibendum libero vitae dignissim. Nam tempor quam a feugiat tincidunt. Nullam scelerisque augue eget nunc vehicula semper. Nam maximus nibh mauris, at sodales turpis sodales nec. Praesent sollicitudin urna purus, sit amet volutpat ante efficitur in. Suspendisse justo enim, dapibus ut nibh in, maximus sodales ipsum. Sed feugiat maximus nisi sit amet consectetur.")
        ]
    }
}

#endif
