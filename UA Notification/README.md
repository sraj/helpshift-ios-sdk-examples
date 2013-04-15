Readme for Integrating Urban Airship for Helpshift Notifications
================================================================

1. Get a valid Urban Airship account. Get yours [here](https://go.urbanairship.com/accounts/register/)

2. Follow the steps described [here](https://docs.urbanairship.com/display/DOCS/Getting+Started%3A+iOS%3A+Push) to setup your application with Apple and enable 
   push notifications.

3. Open ***UA Notification.xcodeproj*** in XCode, navigate to HSDAppDelegate.m

4. Initialize Helpshift library by calling the method
   
   ```
   	[Helpshift installForAppID:@"<YOUR_APP_ID>"  domainName:@"<YOUR_COMPANY>.helpshift.com" apiKey:@"<YOUR_API_KEY>"];
   ```
   inside ***application:didFinishLaunchingWithOptions:*** method (ideally at the top) for more information [refer doc](http://www.helpshift.com/docs/howto/ios/v2.x/#authentication)

5. Refer ***application:didRegisterForRemoteNotificationsWithDeviceToken:*** and ***application:didReceiveRemoteNotification:*** in HSDAppDelegate.m on integrating 
   Helpshift push notification service, for more information [refer doc](http://www.helpshift.com/docs/howto/ios/v2.x/#urban-airship)

6. To setup Bundle Identifier & Code Signing, 
	
	1. Click on ***UA Notification*** Project, to change bundle Identifier

	2. Click on "Build Settings" and select valid APN enabled certificate in ***Code Signing***