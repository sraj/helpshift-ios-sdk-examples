Readme for Notification Count iOS App
=====================================

1. Open ***NotificationCountApp.xcodeproj*** in XCode, navigate to ***Notification Count*** and click on HSDAppDelegate.m

2. Initialize Helpshift library by calling the method

   ```
        [Helpshift installForApiKey:@"<YOUR_API_KEY>"  domainName:@"<YOUR_COMPANY>.helpshift.com" appID:@"<YOUR_APP_ID>"];
   ```
   inside ***application:didFinishLaunchingWithOptions:*** method (ideally at the top)
   for more information [refer doc](http://developers.helpshift.com/ios/getting-started/#initializing)

3. Refer ***notificationCountAsyncReceived:*** delegate method in HSDViewController.m to get notification counts asynchronously,
   for more information [refer doc](http://developers.helpshift.com/ios/notifications/#notification-badges)


![Notification Count screenshot](/Screenshot.png)
