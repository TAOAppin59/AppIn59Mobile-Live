AppIn59Mobile-Live
==================

## Hand-rolled App-In-59 Hybrid Mobile Native Containers for iOS and Android
Built from the generic Single View Application template for Xcode and the Blank Activity template in Android Studio.  The Xcode project incorporates a UIWebView and the Android Studio Project utilizes an Android WebView.  


### The Deploys
I have my own Jenkins build setup for the event that is deploying builds to the location below on the Network Redux VM.  If all went well, you may install the iOS or Android apps through the App in < 59 Minutes Over-The-Air deploy page on the same server the web app resides at:
[http://198.72.80.175/otadeploy/appinfiftynine.html](http://198.72.80.175/otadeploy/appinfiftynine.html)

**A few notable caveats with these app installs - iOS**
- The iOS app is an "Ad Hoc" codesigned build.  As such, it will only install on devices that its Provisioning profile knows about.  If you would like to be able to install it from here, I'll need to get the UDID for our device.  I can add it to the app's profile, and after it is rebuilt with the updated profile, you'll be able to install it at will.  

**There are a couple ways you can get your UDID to me:** 
1. If you have a laptop with you running iTunes, connect your device and you'll be able to see, copy and paste it from the device info.
2. Bring it to me.  I can connect it to my laptop and we can get it that way.
3. There is a site that obtain and email it to you called getudid.io: [http://get.udid.io](http://get.udid.io).  I have used it for this task myself and it works fine, but I would be remiss if I did not advise you to use it at your own risk.

**Android Install Caveats**
- The Android container I'm building here is targeting KitKat.  It may work on older versions of Android, but no guarantees.
- Being that you'll be installing my APK package from a webpage, You do need to allow your device to install from "Unknown sources".  Once you have that enabled, you can download and install it from your Downloads manager.  If you need help, let me know

## The Projects
Both reference the same AppIn59 Project, based on the [angular-grunt-karma-coverage-seed](https://github.com/joetravis/angular-grunt-karma-coverage-seed) project built by Joe Travis.  They do so through a combination of submodule-ing the AppIn59 GIT repository, and then embedding external references to the app folder in that repo within each project.  Because Jenkins now supports updating of submodules, doing this way allows the repository to be cloned and built from a single repo, negating the need for separate builds.

To retrieve updates committed to the AppIn59 head within the submodule, there is a little extra work to do.

> git pull

Won't update the submodule.  To do this, you'll need to either run a little git foreach command to iteratively do a pull in any submodules that exist, like:

> git submodule foreach "(git checkout master; git pull)&"

as a simple one-liner, or because we're only working with a single submodule, you can also navigate down into the AppIn59 submodule folder and do 

> git checkout master
> git pull

Much like Joe's angular-grunt-karma-coverage-seed - okay, soorrta like Joe's angular-grunt-karma-coverage-seed, but to a lesser degree - This can easily serve as boilerplate for the iOS and Android deliverables for a cross-platform, shared codebase desktop/mobile hybrid solution.  From here, one can readily begin to build out a fully custom native container to the solution, with a javascript to native bridge and back in the other direction, add test harnesses for the native container using XCTest for Xcode and the Unit test stack of your choosing for Android.

Why roll your own when there are a plethora of shrink-wrap hybrid solutions out there, like PhoneGap or Titanium?  Good question.  For single-use or slightly more complex apps that don't have an inordinate amount of UI or business rules complexity, or for building prototypes for business folk to review, these are all fine tools to draw from.  They can all get something up and running for you fairly quickly.  

The downside of going this route is, at the end of the day, you are coding to a black box.  While some of them offer some great extensibility and the ability to add native views through support for plugins, because they are a framework they are often giving you a native container, er, containing, much more than is needed for the task of hand.  If all you wish to do is have a barebones native container for your fully functional web app, there isn't much need for it to live in a big native container with a fully fleshed out API for everything from camera access to file access.  You can build yourself one much like these in, arguably, less time, and have something like weight and much more flexible. 

Another problem with these solutions is performance.  In order to build snappy, delightful hybrid applications, you need to have as much control over the memory management of objects as you can possibly get.  With a custom native container, you will always control over the lifetime of the native objects, and can keep your memory profile lean and free of leaks without being at the mercy of a black box.

Finally, another benefit hand-rolled hybrid containers provide is the ability to climb out of them if need be.  If designed right, they can be incrementally migrated, in a fully agile fashion, from the sorts of webviews you see here to a full blown native application.  I was part of a team working on a large B2B iPad/desktop solution for a well-known local sportswear manufacturer where we had to do just that, and it worked out beautifully.

There's a great SmashingMagazine article on mixing hybrid and native views that I highly recommend.  It's a good read:

**[http://mobile.smashingmagazine.com/2013/10/17/best-of-both-worlds-mixing-html5-native-code/](http://mobile.smashingmagazine.com/2013/10/17/best-of-both-worlds-mixing-html5-native-code/)**

A quick scan of the intertubes turned up this simple, no-nonsense tutorial on Building an iOS UIWebView project from scratch:
[http://agilewarrior.wordpress.com/2012/08/29/how-to-uiwebview-ios/](http://agilewarrior.wordpress.com/2012/08/29/how-to-uiwebview-ios/)

And Android's dev site has a great primer on building a WebView app using Android Studio:
[https://developers.google.com/chrome/mobile/docs/webview/gettingstarted](https://developers.google.com/chrome/mobile/docs/webview/gettingstarted)

If you want to talk more about any of this gobbledy-gunk, give me a holler.

[Dee Madden](mailto:dee.madden@sftsrc.com)

## Responsive Design

There are exactly - EGG-ZACTLY - three trillion great blog posts and articles out there for responsive web design, so I would encourage you to do some research.  What I will cover here is the tools I like to use to help facilitate it and CSS work in general.

The first thing is SASS.  It stands for "Syntactically Awesome Stylesheets".  It's a CSS preprocessor framework:
http://sass-lang.com

The SASS compilation work is generally Ruby-driven, and done by a command line utility called Compass:
http://compass-style.org

For style work and web development in general, I am a big fan of JetBrains WebStorm.  Being a product of the JetBrains crew, WebStorm is pretty much what one would expect it to be - the IntelliJ/Resharper of web development IDEs.  It has support baked in for a bunch of the frameworks we're showing off in the event, like Angular and every other popular Javascript MVC framework under the sun, Unit test support with Karma and PhantomJS support baked in, support for SASS and Compass with live edit, which I love, and a whole bunch of other great features.  John Lindquist is part of the team now, the guy behind all of those great AngularJS video tutorials on [egghead.io](https://egghead.io).  He's an evangelist for JetBrains now, and his presence is clearly being felt, as one of the big bang features planned for WebStorm 8 is full AngularJS support.  I am using the WebStorm 8 EAP, which can be had for free:

[http://blog.jetbrains.com/webstorm/2014/01/webstorm-8-eap/](http://blog.jetbrains.com/webstorm/2014/01/webstorm-8-eap/)

WebStorm is also pay, but like AppCode, is super reasonable.  I highly recommend this tool.

The responsive framework we've chosen is maintained by the consulting firm Zurb, and the framework is called, quite simply, Foundation:

[http://foundation.zurb.com](http://foundation.zurb.com)

Another framework we like for this sort of thing and also recommend is Twitter Bootstrap:

[http://getbootstrap.com](http://getbootstrap.com)

The one above is the straight CSS version.  There is also a SASS port for Bootstrap:

[https://github.com/twbs/bootstrap-sass](https://github.com/twbs/bootstrap-sass)

There is also a great collection of SASS extensions, or mixins in SASS-speak, called Bourbon that I highly recommend, though we won't be getting around to using them for this here event:

[http://bourbon.io](http://bourbon.io)

Bourbon has a bunch of helpers that abstract away a bunch of the cross-browser CSS work, among other things.  

And last but DEFINITELY not least, there is an excellent site I like to use for working out my media queries for repsonsive styling.  It's called @media.info:

[http://atmedia.info](http://atmedia.info)

You can hit this site from a browser on any device or desktop, and it will auto-generate what has rounded out to be bomb proof media queries for accurately delineating devices.  Copy/paste the auto-gen'ed query, email it to yourself, drop it in your SASS or CSS media queries block, and you're good to go.

Check them out and have fun!

## How to use AppIn59Mobile

This isn't based on any other endeavor, so clone the stuff here and go to town.  For the Xcode Project, you will need to:

* Have an Apple Developer Account and setup some provisioning profiles of your own, if you want to deploy/debug the app on your device.  It should run fine in the sim without these things.
* Create a keystore of your own for the Android project if you want to create a signed APK

Because the Storyboard portion of the view has already been built out in the XCode project, I wholly recommend commencement of your iOS project by using JetBrains AppCode for your IDE.  For those of you familiar with other JetBrains IDEs like IntelliJ or plugins like Resharper, AppCode is the Objective-C version of those IDEs.  It has a wealth of great refactoring, debugging, and unit testing features built in.  It is a paid application, but is very reasonable for what you get.  The one trade-off with AppCode at the time of this writing is the same problem with pretty much every other alternative iOS IDE, like Xamarin - it has no design-time support like Interface Builder.  They are, however, working on that as a feature in a future release.  For a free 30 day trial version, go to:

**[http://www.jetbrains.com/objc/](http://www.jetbrains.com/objc/)**

For both, navigate into the AppInFiftyNineIOS folder and open the .xcodeproj file.

For the Android project, got out and get yourself the free version of Android Studio from the Android Dev Site:

**[http://developer.android.com/sdk/installing/studio.html](http://developer.android.com/sdk/installing/studio.html)**

And that's it.  No extra stuff to install unless you need backwards compatibilty.  Android Studio comes loaded with the latest version of the Android SDK and build tools, the SDK Manager, and the AVD Manager for setting up emulators.  On the Android side of the fence, I will say that the out-of-the-box version of the emulator will bring you great pain and heartache.  To mitigate this, I recommend installing the Intel HAXM driver, if you are on a modern Intel machine:

**[http://software.intel.com/en-us/android/articles/intel-hardware-accelerated-execution-manager](http://software.intel.com/en-us/android/articles/intel-hardware-accelerated-execution-manager)**

For Windows 8.1 and Mavericks users, at the time I am writing this, read through the instructions before installing.  There is a hotfix for each that you need to apply AFTER installing the main distro in order to get it working correctly.

Once you've got all that setup, just open up the AppInFiftyNineAndroid folder. Android Studio, much like IntelliJ, will just open it up as a workspace.

#### One more thing on Android...
There is another alternative to the mostly super dreadful Android Emulator, and it's nice.  It's called Genymotion.  It's built on VirtualBox.  It's pay but there is a free version that will do pretty much anything you need to do for hybrid development.  Get it here:

**[http://www.genymotion.com](http://www.genymotion.com)**

It has much better UI, is faster than the standard emulator, and has a better set of pre-defined emulators.

### Running the app during development

For the iOS Project using XCode, set a target simulator or device in the upper left, and click on the Run button (looks like a play button) in the same corner.
If you're using AppCode, there are separate play and debug buttons.  They live near the upper right of the top toolbar.  Click on the bug to debug, the play button to run it.

For Android Studio and the Android Studio project, same deal as AppCode.  When you start the app, you will be met with a dialog of targets to choose from. Pick one and continue.

### Running the app during CI process

For both projects, assuming Jenkins is the choice for your CI - as it was with our presentation - I went to great pains with the project setup to make things as straightforward as possible when using the commonly used Jenkins plugins.  For both, if you're pulling from a Github repo like we were doing, you'll want to install the Github and Github API plugins, and configure your builds server for SSH with github.  It makes the configuration part a little easier.  When configuring your Github repos in the job, make sure to configure it to update the submodule at checkout time.  From there, load the Xcode plugin, and set it up to your liking.  Here are a few articles containing portions that served me well:

[http://www.sailmaker.co.uk/blog/2013/04/02/advanced-jenkins-for-ios-and-mac/](http://www.sailmaker.co.uk/blog/2013/04/02/advanced-jenkins-for-ios-and-mac/)
[http://orangejuiceliberationfront.com/setting-up-jenkins-for-github-and-xcode-with-nightlies/](http://orangejuiceliberationfront.com/setting-up-jenkins-for-github-and-xcode-with-nightlies/)
[http://www.brianjcoleman.com/tutorial-setting-up-a-jenkins-automated-build-server-for-ios/](http://www.brianjcoleman.com/tutorial-setting-up-a-jenkins-automated-build-server-for-ios/)

For Android:
[http://blog.zuehlke.com/configure-your-android-project-on-jenkins/](http://blog.zuehlke.com/configure-your-android-project-on-jenkins/)

## Directory Layout

The points of interest in the projects are:

	AppIn59/						          --> The angular seed app.
	
	AppInFiftyNineIOS				      --> The iOS app
		AppInFiftyNineIOS.xcodeproj	--> XCode project file.
		app/						            --> External reference to app folder in AppIn59.
		Main_iPhone.storyboard		  --> UI for the iPhone, contains the UIWebView
		Main_iPad.storyboard		    --> UI for the iPad, same as above
		viewController.h			      --> Header file for the initial view controller for the app, and where the UIWebView is instantiated and set to load the index.html file in AppIn59.
		viewController.m			      --> Implementation file for above.
		
   
	AppInFiftyNineAndroid/          --> Android Studio project for Android version.
	  AppInFiftyNineAndroidApp/
      src/
        main/
          assets/
            app/                  --> symlink to app folder in AppIn59.
            
          java/
            com.example.appinfiftynineandroid.app --> package containing the MainActivity Class
              MainActivity.java   --> the "view controller" of this Android project.  It's the code behind the initial view, where all of the WebView code lives.
          res/
            layout/
              activity_main.xml   --> Android layout file that contains the WebView definition.  This is the main.storyboard > UIWebView of the Android project.
            
              AndroidManifest.xml --> File that persists project-level settings like permissions for the WebView to access the internet, geolocation permissions, and the like.
              
      build.gradle                --> One of the build scripts you may need to touch for build related modifications.