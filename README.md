# Interested in iOS development, CloudBees and Jenkins?

Then this is for you!
"Gasp" is a pun on "Yelp" - a simple restaurant listing and review showcase app with push messages. 

CloudBees: 
    RUN@cloud - a paas to host the mobile backend 
    WEAVE@cloud - watch for changing data, trigger push messages, sync data
    Jenkins DEV@cloud - hosted jenkins for building your iOS and mobile backend apps. 


This is the gasp-ios client - nothing fancy - using NSURLConnection and friends, registering for push messages - no dependencies. 

<img src="https://raw.github.com/mobilepaas/gasp-ios/master/gasp.png">

# Running locally

Clone this repo - open in xcode. Look in CBViewController.m for URLs that this app will connect to for the Gasp 

Tip: to run unit tests locally, by hand, outside of the IDE:
<code>
xcodebuild -target gaspLogicTests -sdk iphonesimulator -configuration Debug TEST_AFTER_BUILD=YES clean build
</code>


