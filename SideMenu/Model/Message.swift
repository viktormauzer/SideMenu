//
//  Message.swift
//  SideMenu
//
//  Created by Viktor Mauzer on 05.08.2022..
//

import Foundation

enum MessageCategory {
    case primary, social, promotions, sent, spam, trash
    
    var categoryName: String {
        switch self {
        case .primary:
            return "Primary"
        case .social:
            return "Social"
        case .promotions:
            return "Promotions"
        case .sent:
            return "Sent"
        case .spam:
            return "Spam"
        case .trash:
            return "Trash"
        }
    }
}

struct Message: Identifiable {
    var id: UUID
    var sender: String
    var title: String
    var body: String
    var categories: [MessageCategory]
    
    var description: String {
        body.trunc(length: 80, trailing: "...")
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
            Message(id: UUID(), sender: "James Jones", title: "Hello friend", body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc tellus nulla, tristique nec venenatis ac, consequat vitae turpis. Nullam pharetra tincidunt efficitur. Nam sollicitudin dictum consequat. Cras facilisis lorem in viverra dignissim. Pellentesque vitae placerat odio. In hac habitasse platea dictumst. Mauris iaculis nisi sed interdum rhoncus. Duis sit amet mollis neque. Quisque vestibulum pulvinar tellus, a facilisis lorem gravida quis. In ut maximus nisi. Aliquam facilisis bibendum libero vitae dignissim. Nam tempor quam a feugiat tincidunt. Nullam scelerisque augue eget nunc vehicula semper. Nam maximus nibh mauris, at sodales turpis sodales nec. Praesent sollicitudin urna purus, sit amet volutpat ante efficitur in. Suspendisse justo enim, dapibus ut nibh in, maximus sodales ipsum. Sed feugiat maximus nisi sit amet consectetur.", categories: [.social]),
            Message(id: UUID(), sender: "Dana Scully", title: "What is going on???", body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc tellus nulla, tristique nec venenatis ac, consequat vitae turpis. Nullam pharetra tincidunt efficitur. Nam sollicitudin dictum consequat. Cras facilisis lorem in viverra dignissim. Pellentesque vitae placerat odio. In hac habitasse platea dictumst. Mauris iaculis nisi sed interdum rhoncus. Duis sit amet mollis neque. Quisque vestibulum pulvinar tellus, a facilisis lorem gravida quis. In ut maximus nisi. Aliquam facilisis bibendum libero vitae dignissim. Nam tempor quam a feugiat tincidunt. Nullam scelerisque augue eget nunc vehicula semper. Nam maximus nibh mauris, at sodales turpis sodales nec. Praesent sollicitudin urna purus, sit amet volutpat ante efficitur in. Suspendisse justo enim, dapibus ut nibh in, maximus sodales ipsum. Sed feugiat maximus nisi sit amet consectetur.", categories: [.primary]),
            Message(id: UUID(), sender: "Fox Mulder", title: "The truth is out there", body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc tellus nulla, tristique nec venenatis ac, consequat vitae turpis. Nullam pharetra tincidunt efficitur. Nam sollicitudin dictum consequat. Cras facilisis lorem in viverra dignissim. Pellentesque vitae placerat odio. In hac habitasse platea dictumst. Mauris iaculis nisi sed interdum rhoncus. Duis sit amet mollis neque. Quisque vestibulum pulvinar tellus, a facilisis lorem gravida quis. In ut maximus nisi. Aliquam facilisis bibendum libero vitae dignissim. Nam tempor quam a feugiat tincidunt. Nullam scelerisque augue eget nunc vehicula semper. Nam maximus nibh mauris, at sodales turpis sodales nec. Praesent sollicitudin urna purus, sit amet volutpat ante efficitur in. Suspendisse justo enim, dapibus ut nibh in, maximus sodales ipsum. Sed feugiat maximus nisi sit amet consectetur.", categories: [.primary]),
            Message(id: UUID(), sender: "Dean Winchester", title: "Saaaaaaaam!!", body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc tellus nulla, tristique nec venenatis ac, consequat vitae turpis. Nullam pharetra tincidunt efficitur. Nam sollicitudin dictum consequat. Cras facilisis lorem in viverra dignissim. Pellentesque vitae placerat odio. In hac habitasse platea dictumst. Mauris iaculis nisi sed interdum rhoncus. Duis sit amet mollis neque. Quisque vestibulum pulvinar tellus, a facilisis lorem gravida quis. In ut maximus nisi. Aliquam facilisis bibendum libero vitae dignissim. Nam tempor quam a feugiat tincidunt. Nullam scelerisque augue eget nunc vehicula semper. Nam maximus nibh mauris, at sodales turpis sodales nec. Praesent sollicitudin urna purus, sit amet volutpat ante efficitur in. Suspendisse justo enim, dapibus ut nibh in, maximus sodales ipsum. Sed feugiat maximus nisi sit amet consectetur.", categories: [.social]),
            Message(id: UUID(), sender: "Sam Winchester", title: "Really, I am ok", body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc tellus nulla, tristique nec venenatis ac, consequat vitae turpis. Nullam pharetra tincidunt efficitur. Nam sollicitudin dictum consequat. Cras facilisis lorem in viverra dignissim. Pellentesque vitae placerat odio. In hac habitasse platea dictumst. Mauris iaculis nisi sed interdum rhoncus. Duis sit amet mollis neque. Quisque vestibulum pulvinar tellus, a facilisis lorem gravida quis. In ut maximus nisi. Aliquam facilisis bibendum libero vitae dignissim. Nam tempor quam a feugiat tincidunt. Nullam scelerisque augue eget nunc vehicula semper. Nam maximus nibh mauris, at sodales turpis sodales nec. Praesent sollicitudin urna purus, sit amet volutpat ante efficitur in. Suspendisse justo enim, dapibus ut nibh in, maximus sodales ipsum. Sed feugiat maximus nisi sit amet consectetur.", categories: [.social]),
            Message(id: UUID(), sender: "Peter Bishop", title: "I'm done with this!", body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc tellus nulla, tristique nec venenatis ac, consequat vitae turpis. Nullam pharetra tincidunt efficitur. Nam sollicitudin dictum consequat. Cras facilisis lorem in viverra dignissim. Pellentesque vitae placerat odio. In hac habitasse platea dictumst. Mauris iaculis nisi sed interdum rhoncus. Duis sit amet mollis neque. Quisque vestibulum pulvinar tellus, a facilisis lorem gravida quis. In ut maximus nisi. Aliquam facilisis bibendum libero vitae dignissim. Nam tempor quam a feugiat tincidunt. Nullam scelerisque augue eget nunc vehicula semper. Nam maximus nibh mauris, at sodales turpis sodales nec. Praesent sollicitudin urna purus, sit amet volutpat ante efficitur in. Suspendisse justo enim, dapibus ut nibh in, maximus sodales ipsum. Sed feugiat maximus nisi sit amet consectetur.", categories: [.primary, .social]),
            Message(id: UUID(), sender: "Jimmy McGill", title: "I've got something for ya!", body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc tellus nulla, tristique nec venenatis ac, consequat vitae turpis. Nullam pharetra tincidunt efficitur. Nam sollicitudin dictum consequat. Cras facilisis lorem in viverra dignissim. Pellentesque vitae placerat odio. In hac habitasse platea dictumst. Mauris iaculis nisi sed interdum rhoncus. Duis sit amet mollis neque. Quisque vestibulum pulvinar tellus, a facilisis lorem gravida quis. In ut maximus nisi. Aliquam facilisis bibendum libero vitae dignissim. Nam tempor quam a feugiat tincidunt. Nullam scelerisque augue eget nunc vehicula semper. Nam maximus nibh mauris, at sodales turpis sodales nec. Praesent sollicitudin urna purus, sit amet volutpat ante efficitur in. Suspendisse justo enim, dapibus ut nibh in, maximus sodales ipsum. Sed feugiat maximus nisi sit amet consectetur.", categories: [.promotions, .social]),
            Message(id: UUID(), sender: "Lalo Salamanca", title: "I'm coming!", body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc tellus nulla, tristique nec venenatis ac, consequat vitae turpis. Nullam pharetra tincidunt efficitur. Nam sollicitudin dictum consequat. Cras facilisis lorem in viverra dignissim. Pellentesque vitae placerat odio. In hac habitasse platea dictumst. Mauris iaculis nisi sed interdum rhoncus. Duis sit amet mollis neque. Quisque vestibulum pulvinar tellus, a facilisis lorem gravida quis. In ut maximus nisi. Aliquam facilisis bibendum libero vitae dignissim. Nam tempor quam a feugiat tincidunt. Nullam scelerisque augue eget nunc vehicula semper. Nam maximus nibh mauris, at sodales turpis sodales nec. Praesent sollicitudin urna purus, sit amet volutpat ante efficitur in. Suspendisse justo enim, dapibus ut nibh in, maximus sodales ipsum. Sed feugiat maximus nisi sit amet consectetur.", categories: [.trash]),
            Message(id: UUID(), sender: "Jesse Faden", title: "You are In CONTROL", body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc tellus nulla, tristique nec venenatis ac, consequat vitae turpis. Nullam pharetra tincidunt efficitur. Nam sollicitudin dictum consequat. Cras facilisis lorem in viverra dignissim. Pellentesque vitae placerat odio. In hac habitasse platea dictumst. Mauris iaculis nisi sed interdum rhoncus. Duis sit amet mollis neque. Quisque vestibulum pulvinar tellus, a facilisis lorem gravida quis. In ut maximus nisi. Aliquam facilisis bibendum libero vitae dignissim. Nam tempor quam a feugiat tincidunt. Nullam scelerisque augue eget nunc vehicula semper. Nam maximus nibh mauris, at sodales turpis sodales nec. Praesent sollicitudin urna purus, sit amet volutpat ante efficitur in. Suspendisse justo enim, dapibus ut nibh in, maximus sodales ipsum. Sed feugiat maximus nisi sit amet consectetur.", categories: [.social, .promotions])
        ]
    }
}

#endif
