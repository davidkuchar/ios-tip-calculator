# CodePath Tip Calculator

This is a basic tip calculator built with all required and optional user stories 
including a few enhancements past that point. I spent some time investigating 
better ways to lay out the code and refactored it to include a DataManager. I
fully translated the app to German.  I built the settings page first in the suggested
way, and then fully rebuilt it when I redesigned the app.

Time spent: 12 hours spent in total

Completed user stories:

 * [x] Required: User can enter a bill amount and see the tip and total amount of the bill
 * [x] Required: User can adjust the tip percentage
 * [x] Required: User can view and adjust settings for the default tip percentage
 * [x] Optional: Remember the bill amount across app restarts. After an extended period of time, clear the state. This is a UI trick that Apple uses with the Spotlight app. If you return there a minute later, it will show your most recent search. if you return 10 minutes later, it defaults to blank. To implement this, plug into the application lifecycle and track time using NSDate.
 * [x] Optional: Use locale specific currency and currency thousands separators.
 * [x] Optional: Add a light/dark color theme to the settings view. In viewWillAppear, update views with the correct theme colors.
 * [x] Additional: Full German translation
 * [x] Additional: User can split the bill up to ten ways using a slider (slider snaps to integer values)

Walkthrough of all user stories:

![Video Walkthrough]()

GIF created with [LiceCap](http://www.cockos.com/licecap/).
