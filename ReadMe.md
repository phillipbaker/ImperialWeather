# Imperial Weather

A weather app that displays the current and upcoming temperature in Fahrenheit and Celsius at the same time.

![iw@3x](https://user-images.githubusercontent.com/16352712/135826266-9b1af907-a1a5-47fa-a613-5de32784a58c.png)

## Why I Made This

I moved from the US to the UK and consequently switched from using Fahrenheit to Celsius. I wanted to “learn” the Celsius scale by seeing equivalent Fahrenheit temperatures side-by-side.

## My Approach

The app displays current weather and hourly and daily temperatures for the user’s current location. The only user feature is a segmented control to switch the primary temperature scale between Celsius and Fahrenheit.

I purposefully wanted to keep the functionality simple for two reasons. First, side-by-side temperatures for my current location was enough to solve my problem. Second, I wanted to spend time on handling errors, decomposing and organizing the SwiftUI view hierarchy, view modifiers and formatted values.

## Solved Problems

One great learning experience here was seeing how many problems even a trivial interface throws up. I’ve outlined some highlights below.

### A Stack View That Adapts to Accessible Text Sizes

At the largest accessible text sizes, the daily weather pane squashed text together and became unreadable (below left). I made a custom and reusable stack view that adapts from a horizontal to a vertical stack for accessible text sizes (below right).

![accessible-text-stackview@3x](https://user-images.githubusercontent.com/16352712/135830154-6ca2c7b8-2e52-4469-979c-6e209ac055f6.png)

### A Stack View That Adapts to Device Size Class

In landscape orientation, the current weather pane takes up the entire vertical height of the screen. Exactly the same as with accessible text, I made a stack view adapt from a vertical to a horizontal layout based on the device Size Class. Now, for devices with a “regular” size class, current weather sits alongside hourly and daily weather. Below is an iPhone 12 Pro Max to illustrate. Non-Max phones have a “compact” size class even in landscape orientation so the problem is not completely solved. Ultimately, current weather takes up too much vertical space even in portrait and needs to be redesigned to be more efficient with space.

![sizeclass-stackview@3x](https://user-images.githubusercontent.com/16352712/135830349-4d1544e4-9766-443d-84f1-5ba564c40e09.png)

### Weather Icons at Night

The icon for clear weather, a sun, didn’t make sense at night. As I was using SF Symbols rather than the API provided icons I needed to account for the switch to a moon icon myself. Surprisingly, most other kinds of weather icon help up for day and night. I tried to pass timezone data from the API around my data model but made a mess. I realized I could use the way the API named its own icons for day and night (by appending a “d” or an “n” to the filename) to determine when to insert my own night time moon icon for clear weather.

### Weather Icon Alignment

Another issue with weather icons was alignment. SF Symbols aren’t visually centered within their frame so all of the icons looked misaligned. The worst case were cloud icons that might or might not include depictions of rain, thunder, fog, sleet or snow. I opted for an 80/20 solution of setting a fixed minimum frame size around weather icons and aligning them all to the top of their frame. This aligned the top of all of the cloud-related icons and solved the distracting level of misalignment although it’s not perfect. A more robust solution would be to align all of the icons visually within their frame and I chose not to invest time to do that over moving on. 

### Voiceover Support for ºC and ºF

One last accessibility issue was that Voiceover would read “degrees C” and “degrees F” because that is exactly what the interface says. Since these abbreviations are used throughout the weather screen it was pretty jarring to hear. I made an accessibility label that reads “Celsius” and “Fahrenheit” in full for those values and moved it into its own view modifier.

### Current Hour in the Past

The first hour of weather returned by Open Weather Map is for the current hour which means it can be in the past. For example, at 10.30am, the first entry for hourly weather is for 10am. I added a check so that if an hour was in the past, it should use the label “Now” instead of the time.

## Remaining Issues

There are a bunch of issues I hope to resolve but left for now in order to ship new work but I want to acknowledge some of them here.

### Location Permission Changes

When I change the location permission in system Settings, the app does not seem to recognize the change until it is completely quit from the background. Similarly, “onAppear” doesn’t seem to update the weather data when the app is reopened from the background but I need to test it more thoroughly.

### Further Refactoring

SwiftUI is almost endlessly composable. I reorganized the code a  lot, more than was productive probably. That said, in its current state it could benefit from further refactoring.

The Idle and Loading views have ended up so similar as to make at least one redundant. It might even be better to move away from a state-driven approach altogether. 

The error type I created requires a lot of code at the call site and I think I can do better. I’m sure there is much, much more.
