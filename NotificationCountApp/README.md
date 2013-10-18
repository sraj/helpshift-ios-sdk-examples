Readme for Notification Count iOS App
=====================================

1. Open ***NotificationCountApp.xcodeproj*** in XCode, navigate to ***Notification Count*** and click on HSDAppDelegate.m

2. Initialize Helpshift library by calling the method

   ```
   	[Helpshift installForAppID:@"<YOUR_APP_ID>"  domainName:@"<YOUR_COMPANY>.helpshift.com" apiKey:@"<YOUR_API_KEY>"];
   ```
   inside ***application:didFinishLaunchingWithOptions:*** method (ideally at the top)
   for more information [refer doc](http://developers.helpshift.com/ios/getting-started/#initializing)

3. Refer ***notificationCountAsyncReceived:*** delegate method in HSDViewController.m to get notification counts asynchronously,
   for more information [refer doc](http://developers.helpshift.com/ios/notifications/#notification-badges)


![Notification Count screenshot](/Screenshot.png)
