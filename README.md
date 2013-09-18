# Interested in iOS development, CloudBees and Jenkins?

Then this is for you!
"Gasp" is a pun on "Yelp" - a simple restaurant listing and review showcase app with push messages. 

> <img src="http://www.cloudbees.com/sites/all/themes/custom/cloudbees_zen/css/bidesign/_ui/images/logo.png"/>
>
> <b>Note</b>: <i>This repo is part of the Gasp demo project - a showcase of <a href="https://developer.cloudbees.com/bin/view/Mobile">cloudbees mobile services</a>.
> You can see the big picture of the <a href="http://mobilepaas.cloudbees.com">showcase here</a>.
> Feel free to fork and use this repo as a template.</i>

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


