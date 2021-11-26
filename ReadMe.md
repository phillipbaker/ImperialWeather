# Imperial Weather

A weather app that displays the current and upcoming temperature in Fahrenheit and Celsius at the same time.

![iw@3x](https://user-images.githubusercontent.com/16352712/142862543-5bc38ee7-c38e-4c8a-b1be-7e2ebdf3b495.png)

## Why I Made This

I moved from the US to the UK and switched from using Fahrenheit to Celsius. I wanted to learn the Celsius scale by seeing the temperature in both scales side-by-side.

## My Approach

The app displays current and upcoming temperatures for users’ current location, with a segmented control to switch the primary scale. This was enough to solve my problem. After that, I focused on the code and spent time handling errors and decomposing the SwiftUI view hierarchy, view modifiers and formatted values.

## Solved Problems

This project was a lesson in how even trivial interfaces throw up more issues than expected. I’ve outlined some of the problems I solved below.

### Accessible Text Sizes

At the largest text sizes, the daily weather pane squashed text and became unreadable (left). Similar to the size classes, I made a stack view that adapts its orientation but this time based on text sizes (right).

![accessible-text-stackview@3x](https://user-images.githubusercontent.com/16352712/135830154-6ca2c7b8-2e52-4469-979c-6e209ac055f6.png)

### Different Device Sizes

In landscape, the current weather pane took up the entire vertical height of the screen (top). I made a stack view that adapts its orientation based on the device size class (bottom).

This works for iPad and Max phone sizes but non-Max phones retain a “compact” size class even in landscape. Ultimately, the current weather pane needs a redesign.

![sizeclass-stackview@3x](https://user-images.githubusercontent.com/16352712/135830349-4d1544e4-9766-443d-84f1-5ba564c40e09.png)

### Weather Icons for Night

Perhaps surprisingly, most of the weather icons held up at night, but not the sun icon for clear weather. I used SF Symbols rather than the API-provided icons so I had to account for the switch to a moon icon myself. I did it by using the API naming convention for images (appending a “d” or an “n” to the filename for “day” and “night”) to determine when to insert my own moon icon.

### Weather Icon Alignment

Using SF Symbols as weather icons presented noticeable misalignment in the horizontal axis (vertical was fine). I set a fixed minimum frame size and aligned icons vertically to the top of their frame as an 80/20 solution.

### Voiceover Support

There are “degrees C” and “degrees F” abbreviations all over the weather screen and it was pretty jarring to listen to in Voiceover. I made an accessibility label that reads “Celsius” and “Fahrenheit” in full, moved it into its own view modifier, and was inordinately happy about much clutter this removed from the views.

### Cleaning API Data

The first hour of hourly weather returned by the API was for the current hour which meant it was usually in the past. I added a check so that if an hour was in the past, it should use the label “Now” for its label.

## Future Development

There are a bunch of issues I hope to resolve over time but left for now to prioritize new work.

- The app does not recognize changes to the system location permission until it is completely quit from the background.
- A number of new APIs were introduced in iOS 15 that are relevant here, including an overhaul of the DateFormatter API and the new Async/Await concurrency APIs.
- SwiftUI is almost endlessly composable. I reorganized the code a lot but it could benefit from further refactoring. For example, the Idle and Loading views are similar to the point that one is redundant. Making more changes might make it better to move away from the state-driven paradigm altogether. I also think I can do better with the custom error type I created, which requires a lot of code at the call site.
