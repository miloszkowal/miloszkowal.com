---
title: "Automating Habit Tracking using Habitify and Siri Shortcuts"
date: 2019-09-09T13:52:47-04:00
draft: false
tags: ["technology"]
---

# Introduction

As countless books may tell you, habits are the key to success. These small behaviors that one works into their lifestyle over time can make dramatic changes down the line. Much like the power of compounding interest in the bank, habits are like the daily deposits we make into the account of life.

Ideally, habits are automated. That is, they become so ingrained in our lifestyles and psyches that we don't even think twice about doing them. We don't even think once. They become not just second nature, but part of our nature itself. Things like brushing your teeth or daily exercise are some of those habits that some of us don't even think about. We want to add as many good habits on top of this as possible.

If you really sit down and think about it, most of your actions are habitual anyway. What is the first thing you do when you wake up in the morning? Unfortunately, most of us probably reach for our phones, since our phone is our alarm (I'm a culprit myself; instead, we should be drinking water). Breaking out of these habits is a challenge, sometimes much harder than establishing new ones.

This is where [Habitify](https://habitify.me/en) comes into play. This lovely app that I discovered several months ago allows the user to put in the habits that they want to track (the free version only allows three at a time), and what time you'd want to complete them (morning, afternoon, or evening, with an "anytime" option). Each time you complete the actions that you want to turn into the habit, the idea is that you go to the app and press the check mark, which reinforces the action and gives you a little dopamine reward.

However, this introduces an added layer of complexity. You have to make checking your habits into a habit, otherwise, days will pass in Habitify without any check marks, while you've been meditating or exercising and establishing those pathways. I've fallen guilty of this myself, so I've incorporated checking Habitify into my nightly ritual, right before I go to sleep. This at least allows me to keep consistent progress of the actions I want to turn (or have already turned) into habits.

But let's up the ante a bit. How can we automate habit tracking, and thus habit generation? I've written some other experiments in Siri Shortcuts, so I figured that this would be the best vector of attack, since Habitify exist on iOS natively and plays with Siri Shortcuts.

For the purposes of this post, let's work with the following Habit List:

- Meditation
- Exercise
- Gratitude

You can see more good habits to establish [here](https://www.developgoodhabits.com/good-daily-habits-list/).

# What is Habitify and How to Use It

Habitify is a wonderful light-weight app designed for tracking habits. It does away with the gimmicks of gamification (although there is some very good research done on the topic of introducing gaming elements), a la [Habitica](https://habitica.com/). Instead, it relies on a simple checklist of habits that you complete at the end of every day (or in the morning or afternoon — the app allows you to set up when certain habits should be completed; personally, I just check everything at the end of the day before bed). The problem arises that now, you have to get into the habit of checking Habitify. This in and of itself can be a difficult thing to establish, especially if one of your habits that you want to set up is using your phone less.

Recently, Habitify introduces an integration with Siri Shortcuts. While not perfect, it allows you to mark any habit as completed. This is more than enough to get started with some very simple "automations" that we will be working with here.

# Automating Habits

Two of the three habits here are health-related, so we will be dealing with the Health Siri Shortcuts integration, which is one of the most powerful integrations that Apple has constructed within Siri Shortcuts.

## Meditation

First of all, why meditate? There are numerous studies that show the benefits of meditation, but the key point that I personally take away from the practice is an increased attention span.[^1][^2] Think of meditation as a Pomodoro for your brain. Every time you complete a meditation session, it's like completing a session of focused work. That exercise of mindfulness carries over to everything you do, particularly creative pursuits like programming and design.

For meditation, I use the [Calm.com](https://www.calm.com/) app. This is plugged into HealthKit and creates an entry in the Mindful Minutes category every time I finish a meditation session. Since it's in the Health app, we can access it using Shortcuts, under the "Find Health Samples Where" command. This allows me to specify the type as Mindful Minutes, and the start date being today (since we're only interested in the current day's habits). You can specify additional filters if you wish with the "Add Filter" button, but we only really need to ensure that our entry returns, without much care for what's returned in it (for now).

I was not able to construct a way that, given the list of entries that are returned by the above, returns a boolean of whether it's empty or not, so the workaround for that it is getting the duration of the meditation session. This shortcut assumes that you meditate for longer than a minute in a session, which is the reason behind the "if input is greater than 1" conditional. The command to help us here is the "Get Details of Health Sample" command that allows us to extract any one piece of information from a health sample. It appears that this is Apple's acknowledgment that we can't check if a list is empty or not, since using filters can produce the same outcome (if someone knows how to do this, please contact me).

Either way, we now have a conditional that checks if we meditated. After the first time we pass or fail a habit, Habitify creates a Siri Shortcut for us that we can call from the Shortcuts app. So the first entry has to be manual, but then we can automate. Therefore, if Shortcuts detects an entry of longer than a minute, we pass, otherwise we fail.

## Exercise

I think the benefits of exercise are obvious. One of the most important benefits of physical exercise appears to have a role in neuroplasticity and spatial learning, and memory.[^3] Either way, you will likely become more productive through exercising, even if it's just 25 minutes a day (which puts you above the Department of Health recommendations).[^4]

The process is very similar for exercise, since it is a health-based habit. Assuming that we want to track cardiovascular exercise, we can take a variety of options. For this, we'll be going by "Walking + Running Distance," but you can just as easily search by things like Cycling Distance, Swimming Distance, and so on. The strange omission from this is the lack of "Exercise Minutes," which seems to make the most sense as a tracker (we'd want to know how long we've exercised). But let's just say for now, we care about how long we walked. The important note here is to _not_ limit the search for only one health sample. Health samples for walking are created continuously, so the phone actually creates a multitude of health points under these categories (particularly if you have an Apple Watch). The more important point here is to use the group by functionality to only retrieve the day's samples ("Group by Day").

Once we have this, we can do the same as above, and check whether we walked or ran (or whatever you decide to search for) more than our specified amount of miles. Let's say our goal is at least three miles a day. This is another simple if statement and more Complete or Fails using the Habitify shortcut.

## Gratitude

Gratitude is an interesting habit, since it's generally not thought of as an action. According to many published psychologists, expressing gratitude (or receiving it, when expressed by a manager) leads to a better overall outlook on life.[^5][^6] I personally try to practice gratitude every day, even if it is something as simple as saying that "I'm grateful for the way the sky looked today." Even something as seemingly trivial as that has already had a marked impact on my mental and emotional well-being.

Since gratitude is more of a writing habit, it makes sense to track it using the Notes app. Siri Shortcuts allows us to create notes using any text we pass as input. For the purposes of this demonstration, we will assume that you want to keep track of what you're grateful for in individual notes, and you don't use any other form of journaling for your gratitude journal. Another take for this is asking the user whether they've created an entry in their gratitude journal (since I do my writing manually in a physical notebook, that's the route that makes more sense for me).

Siri Shortcuts allows the user play with their notes, which will be instrumental. For the purposes of this, we will have a note created every time we create an entry. There is a high likelihood that this approach will get messy rather quickly, but I was not able to produce a way to find a note and then pass text into it. Siri Shortcuts decided to keep throwing "unable to convert text to note" errors. Maybe this will be resolved in a future update to the app. So for now, we're doing this.

Also, notice that I added a command to get the current date. This is just so that we can pass the content of the question "What are you grateful for?" with a date to the Notes app. Then, when we conduct reviews of our notes app, then we can see the days when we were grateful for things. The added #gratitude tag is there just for searching.

# Next Steps for Habitify's Siri Integration

I would love for the ability to export my data as a CSV from within Siri Shortcuts, so I can then pass it into a Tableau dashboard. If I want to do that now, I have to manually export the data. Habitify has already been notified of my suggestion.

Another thing that I'm personally excited for is the ability to trigger automations just like scenes in the Home app (by timed triggers). This way, habit tracking with Habitify can be fully end-to-end automated once it's set up the first time. Just set the shortcut to run every night right before the clock ticks over to the new day, and boom, you're tracking your habits. There is something to be said about the psychological component of actually ticking the checkbox, so it will be entirely up to you to decide whether you will take advantage of this.

# Conclusion

The benefits of building habits themselves are well-established.[^7] Having a way to keep track of them is just an icing on the cake, so big thanks to the folks over at Habitify for making an app that's easy to use and helps me and many others keeps track of the new habits they want to build, and old habits that they want to see their amazing streak at.

Habits are somewhat of a personal interest of mine, so you can definitely see more articles about habits and habit tracking (and automation) in the coming weeks and months.

_Note: I have not been paid to mention any of the apps here. These are just apps that I use because I find them to be awesome. That being said, if the makers of Calm or Habitify read this and want to work together, hit me up._

# References

[^1]: https://www.healthline.com/nutrition/12-benefits-of-meditation
[^2]: https://www.ncbi.nlm.nih.gov/pubmed/23643368
[^3]: https://www.ncbi.nlm.nih.gov/pubmed/26646070
[^4]: https://www.heart.org/en/healthy-living/fitness/fitness-basics/aha-recs-for-physical-activity-in-adults
[^5]: https://www.health.harvard.edu/healthbeat/giving-thanks-can-make-you-happier
[^6]: https://psycnet.apa.org/journals/amp/60/5/410/
[^7]: https://web.archive.org/web/20130112052218/http://dornsife.usc.edu/wendywood/research/documents/Neal.Wood.Quinn.2006.pdf
