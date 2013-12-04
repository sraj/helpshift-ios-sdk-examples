Readme for Integrating Urban Airship for Helpshift Notifications
================================================================

1. Get a valid Urban Airship account. Get yours [here](https://go.urbanairship.com/accounts/register/)

2. Follow the steps described [here](https://docs.urbanairship.com/display/DOCS/Getting+Started%3A+iOS%3A+Push) to setup your application with Apple and enable
   push notifications.

3. Open ***UrbanAirshipApp.xcodeproj*** in XCode, navigate to ***UA Notification*** and click on HSDAppDelegate.m

4. Initialize Helpshift library by calling the method

   ```
      [Helpshift installForApiKey:@"<YOUR_API_KEY>"  domainName:@"<YOUR_COMPANY>.helpshift.com" appID:@"<YOUR_APP_ID>"];
   ```
   inside ***application:didFinishLaunchingWithOptions:*** method (ideally at the top)
   for more information [refer doc](http://developers.helpshift.com/ios/getting-started/#initializing)

5. Refer ***application:didRegisterForRemoteNotificationsWithDeviceToken:*** and ***application:didReceiveRemoteNotification:*** in HSDAppDelegate.m on integrating
   Helpshift push notification service, for more information [refer doc](http://developers.helpshift.com/ios/notifications/#configure-urban-airship)

6. To setup Bundle Identifier & Code Signing,

	1. Click on ***UrbanAirshipApp*** Project, to change bundle Identifier

	2. Click on "Build Settings" and select valid APN enabled certificate in ***Code Signing***



![UA Notification screenshot](/Screenshot.png)		![UA Notification screenshot](/Screenshot2.png)
