# Imperial Weather

A weather app that displays temperatures in Fahrenheit and Celsius side-by-side. 

I moved from the US to the UK and switched from using Fahrenheit to Celsius. I wanted to see both scales side-by-side to get familiar with temperatures in Celsius. After that, the app became a sandbox. I’ve used it to explore SwiftUI, app architecture, networking, concurrency, accessibility and localisation.

&nbsp;&nbsp;

![iw-collage](https://github.com/phillipbaker/ImperialWeather/assets/16352712/3c7d13ca-c108-41d2-8e27-ec7200d7de43)

&nbsp;&nbsp;

## Technologies & Frameworks

- **Swift**
	- Migrated completion handlers to Swift Concurrency APIs. Swift 6 compliant.
- **SwiftUI**
	- Observable Objects, Environment Values, Layout protocol, custom view modifiers, composable views.
- **[Unit Tests](https://github.com/phillipbaker/ImperialWeather/tree/main/ImperialWeatherTests/Home)**
	- 92% coverage of non-view code. 
	- Refactored tests from XCTest to new Swift Testing framework.
- **Clean Architecture** 
  - Refactored from MVVM to a Clean Architecture.
  - Immutable data mapping between app layers.
- **[Networking](https://github.com/phillipbaker/ImperialWeather/tree/main/ImperialWeather/Home/Framework/Remote)**
  - Two concurrent network requests using URLSession and async/await APIs.
  - Raw models decoded from JSON with Codable. Errors handled. 
  - Protocol-based URL construction and network requests.
  - Injectable URLSession for unit testing.
- **Core Location**
	- Location object emits location updates and errors in an AsyncStream.
- **Error Handling**
	- Handles network and location errors and displays error messages using a common error message protocol.
- **[Swift Navigation](https://github.com/pointfreeco/swift-navigation)**
  - A [Point-Free](https://www.pointfree.co) framework that enables safer, more ergonomic navigation for SwiftUI.
- **Swift Charts**
	- Detail view displays a chart that can switch between Celsius and Fahrenheit.
  - Annotated axes and accessibility labels for VoiceOver.
- **Measurement**
	- Refactored to use Apple’s Measurement framework for system temperature conversion and localisable temperature labels and VoiceOver support.
- **Accessibility**
	- Adapts layout for accessible text sizes.
	- Accessibility labels to support VoiceOver.
	- Conducted accessibility audit using Xcode’s Accessibility Inspector tool.
- **Localisation**
	- Localised into Spanish.
  - Leverages Measurement framework for localised temperature scale values and descriptions.

