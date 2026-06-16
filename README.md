# Imperial Weather

[![CI](https://github.com/phillipbaker/ImperialWeather/actions/workflows/ci.yml/badge.svg)](https://github.com/phillipbaker/ImperialWeather/actions/workflows/ci.yml)
![Platform](https://img.shields.io/badge/platform-iOS-blue)
![Swift](https://img.shields.io/badge/Swift-6.0-orange)
![SwiftUI](https://img.shields.io/badge/SwiftUI-✓-blue)

A SwiftUI weather app that displays temperatures in **Fahrenheit and Celsius side-by-side**.

I moved from the US to the UK and switched from Fahrenheit to Celsius. I wanted to see both
scales at once to build an intuition for temperatures in Celsius. Since then the app has become
a personal sandbox for exploring SwiftUI, app architecture, networking, concurrency,
accessibility, and localisation.

&nbsp;

![iw-collage](https://github.com/phillipbaker/ImperialWeather/assets/16352712/3c7d13ca-c108-41d2-8e27-ec7200d7de43)

&nbsp;

## Features

- **Dual temperature scales** — current, hourly, and daily temperatures shown in both °F and °C.
- **Current conditions** for your location, backed by Core Location.
- **Hourly and daily forecasts** with weather icons and descriptions.
- **Detail view with charts** — tap a day to see a Swift Charts temperature plot that toggles
  between Celsius and Fahrenheit.
- **Accessible** — adapts to large text sizes and provides VoiceOver labels throughout.
- **Localised** into English and Spanish, including units and weather descriptions.

## Architecture

The app follows a **Clean Architecture** (refactored from MVVM) organised around the `Home`
feature, separating concerns into distinct layers:

| Layer | Responsibility |
| --- | --- |
| **Application** | Use cases (`GetWeather`) and domain entities, with immutable "plain" value types for mapping between layers. |
| **Presentation** | `HomeViewModel`, `HomeState`, `HomeIntent`, and formatting/temperature-scale logic. |
| **Data** | Gateways and data-source implementations bridging the domain to the framework layer. |
| **Framework** | SwiftUI views, networking (`URLSession` + `Codable`), Core Location, and localisation resources. |

Data is mapped into immutable value types as it crosses layer boundaries, keeping the domain
free of framework details and making the code straightforward to unit test.

## Tech Stack

- **Swift 6** — fully Swift 6 language-mode compliant; completion handlers migrated to
  `async`/`await`.
- **SwiftUI** — composable views, custom view modifiers, the `Layout` protocol, environment
  values, and observable state.
- **Swift Concurrency** — two weather endpoints fetched concurrently with `async let`; Core
  Location updates and errors surfaced through an `AsyncStream`.
- **Networking** — protocol-based URL construction and requests over `URLSession`, JSON decoded
  with `Codable`, and an injectable client/session for testing.
- **Error handling** — network and location errors mapped to user-facing messages through a
  common error-message protocol.
- **Swift Charts** — interactive temperature chart with annotated axes and VoiceOver support.
- **Measurement framework** — system temperature conversion plus localisable temperature labels.
- **Swift Testing** — unit tests covering ~92% of non-view code (migrated from XCTest).
- **Accessibility & Localisation** — Dynamic Type support, VoiceOver labels (audited with the
  Accessibility Inspector), and English/Spanish localisation.

Weather data is provided by [OpenWeatherMap](https://openweathermap.org).

## Requirements

- Xcode (latest stable; CI runs on macOS with the latest stable Xcode)
- Swift 6.0
- iOS 17.4+ deployment target

## Getting Started

1. Clone the repository:
   ```sh
   git clone https://github.com/phillipbaker/ImperialWeather.git
   cd ImperialWeather
   ```
2. Open the project in Xcode:
   ```sh
   open ImperialWeather.xcodeproj
   ```
3. Select the **ImperialWeather** scheme and run on a simulator or device.

The project depends only on the [SwiftLint](https://github.com/SimplyDanny/SwiftLintPlugins)
build plugin, resolved automatically by Swift Package Manager — no manual setup required. A demo
OpenWeatherMap API key is bundled so the app runs out of the box.

## Testing

Run the test suite from the command line:

```sh
xcodebuild test \
  -project ImperialWeather.xcodeproj \
  -scheme ImperialWeather \
  -destination 'platform=iOS Simulator,name=iPhone 17'
```

Or run the tests in Xcode with <kbd>⌘</kbd>+<kbd>U</kbd>.

## Continuous Integration

Every push and pull request runs [GitHub Actions](.github/workflows/ci.yml), which lints with
SwiftLint and runs the full test suite on an iOS simulator.

## Screenshots

Localised App Store screenshots are generated with
[fastlane snapshot](https://docs.fastlane.tools/getting-started/ios/screenshots/):

```sh
bundle install
bundle exec fastlane screenshots
```

## License

This project is a personal portfolio app. Weather data © [OpenWeatherMap](https://openweathermap.org).
