Readme for Notification Count iOS App
=====================================

1. Open ***Notification Count.xcodeproj*** in XCode, navigate to HSDAppDelegate.m

2. Initialize Helpshift library by calling the method
   
   ```
   	[Helpshift installForAppID:@"<YOUR_APP_ID>"  domainName:@"<YOUR_COMPANY>.helpshift.com" apiKey:@"<YOUR_API_KEY>"];
   ```
   inside ***application:didFinishLaunchingWithOptions:*** method (ideally at the top) for more information [refer doc](http://www.helpshift.com/docs/howto/ios/v2.x/#authentication)