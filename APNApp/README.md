Readme for Push Notification iOS App
=====================================

1. Open ***APNApp.xcodeproj*** in XCode, navigate to ***Push Notification*** and click on HSDAppDelegate.m

2. Initialize Helpshift library by calling the method
   
   ```
   	[Helpshift installForAppID:@"<YOUR_APP_ID>"  domainName:@"<YOUR_COMPANY>.helpshift.com" apiKey:@"<YOUR_API_KEY>"];
   ```
   inside ***application:didFinishLaunchingWithOptions:*** method (ideally at the top) 
   for more information [refer doc](http://www.helpshift.com/docs/howto/ios/v2.x/#authentication)

3. To setup Bundle Identifier & Code Signing, 
	
	1. Click on ***Push Notification*** Project, to change bundle Identifier

	2. Click on "Build Settings" and select valid APN enabled certificate in ***Code Signing***

4. Refer ***application:didFinishLaunchingWithOptions***, ***application:didRegisterForRemoteNotificationsWithDeviceToken:*** and ***application:didReceiveRemoteNotification:*** in HSDAppDelegate.m on integrating 
   Helpshift push notification service, for more information [refer doc](http://www.helpshift.com/docs/howto/ios/v2.x/#hs-push-notif)


![Push Notification screenshot](/Screenshot.png)		![Push Notification screenshot](/Screenshot2.png)