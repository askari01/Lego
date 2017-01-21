# Lego

Lego is a cloud-enabled, mobile-ready, offline-storage, Wikitude powered Path  finder.

  - 2d markers based on geolocations to identify path for a journey
  - 3d models on specific geolocations to identify a checkpoint in a journey
  - Custom 3d models generations on user markers to help gain more knowledge about the environment

You can also:
  - Import and save files from phone library
  - Share links add videos or custom messages to a marker
  - Record Video of your journey
  - Publish journey for all or specific users

Markdown is a lightweight markup language based on the formatting conventions that people naturally use in email.  As [John Gruber] writes on the [Markdown site][df1]

> The overriding design goal for Markdown's
> formatting syntax is to make it as readable
> as possible. The idea is that a
> Markdown-formatted document should be
> publishable as-is, as plain text, without
> looking like it's been marked up with tags
> or formatting instructions.

This text you see here is *actually* written in Markdown! To get a feel for Markdown's syntax, type some text into the left window and watch the results in the right.

### Tech

Lego uses a number of open source projects and paid sdks to work properly:

* [Wikitude] - AR sdk for geo location rendering!

And of course Lego itself is open source with a [public repository][dill]
 on GitHub.

### Installation

Lego requires [Wikitude](http://www.wikitude.com) v5+ to run.

Download and extract the [javascript api sdk for ios](http://www.wikitude.com/download/).

1. Clone the Lego repo
2. Extract the sdk and copy the framework folder from sdk to Lego/ 
3. Go to Link Frameworks and Libraries in Xcode under General tab and add the following:
Accelerate.framework
AssetLibrary.framework
AVFoundation.framework
CFNetwork.framework
CoreGraphics.framework
CoreLocation.framework
CoreMedia.framework
CoreMotion.framework
CoreVideo.framework
JavaScriptCore.framework
Foundation.framework
MediaPlayer.framework
OpenGLES.framework
QuartzCore.framework
Security.framework
SystemConfiguration.framework
UIKit.framework
Also Add The Following Dynamic Libraries
libc++.tbd
libz.tbd

### Permissions

Lego is currently using the following permissions.
Update your info.plist file
* Privacy - Camera Usage Description
* Privacy - Location Usage Description
* Privacy - Location When In Use Usage Description
* Privacy - Photo Library Usage Description

### Development
You need physical device to test it.
### Todos

 - Write Tests
 - Write Server to save user data
 - Add Code Comments
 - Rethink and Redesign UI & UX
 - Move Lego from MVP to Beta
 - Record Journey
 - Share Journey
 - Add Socal comments features like adding comments to a marker

License
----

MIT
