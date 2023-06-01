# shy

shy is a demo iOS application protected using [IOSSecuritySuite](https://github.com/securing/IOSSecuritySuite) library. The app was created to test new bypass methods for jailbreaking, tampering, debugging, emulation and more.

I initially wanted to create [Scrumdinger](https://developer.apple.com/tutorials/app-dev-training/getting-started-with-scrumdinger) from Apple's official documentation. Dropped it in half and started implementing security protection measures. However I highly recommend taking the course(In the end I did it).

## Core

+ **Homepage** consists of a clickable card which showing the number of defense to be bypassed.

+ **Check Device Status** consists of a clickable button that shows the current security status of the phone. The goal is to bring all Boolean fields to FALSE by exploiting several bypass methods.

## Demo

![GIF](https://media.giphy.com/media/v1.Y2lkPTc5MGI3NjExMmYzY2M4NmYwYjQyNDA2YTBjMTMxMzAwMTkzY2I3MmNmOTYwOGY3MSZlcD12MV9pbnRlcm5hbF9naWZzX2dpZklkJmN0PWc/sVh7YKFzx59tOJI0BV/giphy.gif)

## Minimum requirements

At the moment shy supported only iOS 16.

## Installation

### Method 1

From **Releases**, download shy ipa file. Sideloading it with tool like [Sideloadly](https://sideloadly.io/), [CydiaImpactor](http://www.cydiaimpactor.com/) and more.

After installing App can generate errors. For fix:  

+ Enable Developer Mode go to Settings > Privacy & Security on the iOS device. Scroll down to the Developer Mode list item and navigate into it. To toggle Developer mode, use the “Developer Mode” switch.
+ Trust Developer in Settings > VPN & Device Management

### Method 2

With your Iphone, from **Releases**, follow **download-shy** link, insert password and download app.

## Library Used for shy Project

[IOSSecuritySuite](https://github.com/securing/IOSSecuritySuite)
