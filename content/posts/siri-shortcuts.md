---
title: "Siri Shortcuts: A Great Start, But Falls Short in Its Purpose"
date: 2018-11-21T19:17:35-04:00
draft: false
tags: ["technology"]
---

# Introduction

With iOS 12, Apple finally told us what they’re doing with their acquisition of Workflow. The answer came in the form of Siri Shortcuts, a whole new app (really just an update to the existing Workflow app), which promised automation capabilities that could be triggered with the world’s fickle digital assistant. Shortly after the first beta releases of iOS 12 were available to developers and to the public, Apple released the Siri Shortcuts beta to developers so that they could adapt their apps to the new Siri APIs. A few apps, like CityMapper and Overcast, quickly took advantage of this new technology and added Siri Shortcuts capabilities for things like playing the most recent unplayed episode of a podcast or retrieving directions to a location of choice.

But let’s discuss the Siri Shortcuts app itself. After downloading it and importing your Workflow automations, if any, you’re greeted with a view of all your Shortcuts. Tapping any one of them runs the shortcut, and tapping the three dots allow you to edit it. In the Gallery view, you’re greeted with Apple-designed shortcuts that you can leverage in your own life. They have shortcuts for playing music (Apple Music required), sharing links and locations with contacts, and traveling ETA to work, home, or the next event on your calendar. Overall, those shortcuts are good for beginners, but if you’re a power user that wants to chain multiple actions together, you’ll quickly find that these shortcuts don’t offer much that an extra tap or two within the app won’t do.

If you want to design your own shortcuts, which is what you’ll likely do if you’re reading this piece, then in the Library pane, you’re given the option to create a new shortcut. There, you’re immediately inundated with the massive library of actions that Siri Shortcuts supports out of the box. Luckily, the search option is versatile enough to search for the things you want to do, and return them to you, even if you don’t type in the exact phrasing of the action. Your best bet, however, is know what category the action is in (Music, Maps, System, etc.) and then get what you want from there.

This is where the first “drawback” of Siri Shortcuts comes in. The gap between the Gallery shortcuts and designing your own is far too wide for the casual user, which is likely why Apple didn’t bundle Shortcuts with iOS 12. The reason for the quotes is that it’s not really a drawback depending on who you are. If you’re an automation aficionado, then you’ve been using Workflow and this is just a natural transition for you. If you’re a casual user, chances are you didn’t even know Siri Shortcuts was available until you read about it online.

Once you chain the actions you want together (along with scripting actions like if statements, and rudimentary repeats), you have your shortcut. You can assign it a name, an icon, and even a trigger phrase that vastly expands the out-of-the-box phrases that Siri comes with.

On paper, Siri shortcuts is great. It allows you to do things that were otherwise cumbersome to do, like turn off WiFi with a single tap without having to dig into the settings. The chaining of actions and pulling together if statements, while phenomenal, quickly falls short for any hardcore automation fan. Things like lack of event- and action-based triggers for shortcuts, as well as poor integration with HomeKit and a complete lack of integration with IFTTT (short of a roundabout hack, which you can find here) make it an automation system that leaves much to be desired.

# Event- and Location-based Triggers

At least personally, the primary reason for using Siri shortcuts is leveraging multiple chained actions together to perform tasks at key moments in my day. For example, I have a shortcut that does the following things, that I trigger every day on my way to work:

- Turn of WiFi
- Turn on low power mode and Do Not Disturb
- Send a good morning text to my girlfriend

I can add an arbitrary number of things to this action (I used to have it play a podcast too from Overcast). This is a huge step forward for this, since it’s honestly a “set it and forget it” chain. However, I still have to build the habit of actually triggering the action when I’m leaving my apartment. If HomeKit can have location-based automation triggers, why can’t Siri Shortcuts?

The same holds true for event-based triggers. Certain Android phones have an extreme low power mode feature where they turn off virtually all switches, set the display to black and white, and attempt to squeeze out as much as possible from whatever little battery you have left. While iOS does not have that kind of feature out of the box, something similar can be done using Siri Shortcuts, by simply chaining things like turning off WiFi and Bluetooth, turning on Airplane mode, and turning the display down, to be in one shortcut. However, what good is making the shortcut if you can’t set it to automatically run when your battery reaches a certain threshold? Of course you can have an “if” statement that checks the level, but you still have to tap the shortcut to actually run it.

# Weird Homekit Integration

Siri Shortcuts does play with HomeKit. You can have shortcuts trigger certain scenes from within the shortcut. However, that’s where the integration ends. I can’t have a shortcut just adjust the lights or only set my thermostat to a certain temperature. For example, I would love this to be a possible shortcut, one for my evening routine.

- Ask me questions about my habits and log the responses in Habitify
- Ask me if I journaled, and if I respond no, open Ulysses to a new sheet
- Lower my blinds and turn off all the lights other than the bedroom light
- Set my thermostat to a specific temperature

Theoretically, I can combine the last two into a single scene and then run that scene within the shortcut, but that still feels too restrictive, especially if I only want one thing to run. However, given that for most users the scenes are enough, I doubt we can expect Apple to allow us to adjust individual HomeKit devices from within Shortcuts.

# Lack of IFTTT Integration

This is obvious. Apple does not want to play with IFTTT, since then people wouldn’t buy HomeKit products as much (Nest has IFTTT), and they would just use Shortcuts as an abstraction for IFTTT in a lot of cases. What hurts the most is that Workflow played with IFTTT just fine. This severely limits Shortcuts’ usability. Certain devices don’t work with HomeKit but do work with IFTTT, like things like smart kettles and other kitchen devices. This is a clear example of Apple trying to lock us in their beloved walled garden, with only glimpses of the greener grass on the other side.

# Other Woes

There is a steep learning curve for newcomers. This is a very rudimentary programming interface (similar to MIT’s Scratch), so it might be offputting to some iOS users. Former users of Workflow will embrace this wholeheartedly, and I believe this is primarily why the app is not installed by default on iPhones: it’s meant for the power user. Finally, there is absolutely no documentation from Apple other than a measly [about page](https://support.apple.com/en-us/HT209055) for Shortcuts. Therefore, I’m not really sure what I can do unless I search for it and hope to get a result. An official documentation page that details every possibility in the box would be helpful. The Gallery acts as documentation (in a sense), by providing examples.

Overall, this isn’t the last we’ll see of Siri Shortcuts. Apple has already updated it several times, for things like the new iPad Pro support and also support for additional weather widgets and playback using HomePod (which was a huge pain point for triggering music to play, as triggering it from the HomePod would start playback on iPhone). I’m cautiously optimistic about the future of Shortcuts under Apple. At least it’s good to know Apple didn’t buy Workflow just to ax it.
