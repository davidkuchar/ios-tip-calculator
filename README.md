# CodePath Tip Calculator

This is a basic tip calculator built with all required and optional user stories
including a few enhancements past that point. I spent some time investigating
better ways to lay out the code and refactored it to include a DataManager. I
translated the app to German - I kept some of the design wordy so I could
better show that off. I built the settings page first in the suggested
way (with a Modal), and then fully rebuilt it when I redesigned the app.

*NEW*

Added the use of Cocoapods for managing dependencies, and added some hello-world
level Parse support. Looked into Alamofire. Reviewed a few apple-released swift
videos and read about swift code styling as advised. Added installation instructions
and a license.

Time spent: 16 hours

## Installation Instructions

This app requires that you install Cocoapods. To do that:

1. Run

        sudo gem install cocoapods
2. Run

        pod install
3. Run

        open TipCalculator.xcworkspace

This app is optimized for iOS 8.2 & iPhone 5.

## Completed user stories

 * [x] Required: User can enter a bill amount and see the tip and total amount of the bill
 * [x] Required: User can adjust the tip percentage
 * [x] Required: User can view and adjust settings for the default tip percentage
 * [x] Optional: Remember the bill amount across app restarts. After an extended period of time, clear the state. This is a UI trick that Apple uses with the Spotlight app. If you return there a minute later, it will show your most recent search. if you return 10 minutes later, it defaults to blank. To implement this, plug into the application lifecycle and track time using NSDate.
 * [x] Optional: Use locale specific currency and currency thousands separators.
 * [x] Optional: Add a light/dark color theme to the settings view. In viewWillAppear, update views with the correct theme colors.
 * [x] Additional: German translation
 * [x] Additional: User can split the bill up to ten ways using a slider (slider snaps to integer values)

## Walkthrough of all user stories

![Video Walkthrough](TipCalculator.gif)

GIF created with [LiceCap](http://www.cockos.com/licecap/).
