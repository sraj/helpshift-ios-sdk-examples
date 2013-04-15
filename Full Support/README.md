Readme for Full Support iOS App
===============================

1. Open ***Full Support.xcodeproj*** in XCode, navigate to ***Full Support*** and click on HSDAppDelegate.m

2. Initialize Helpshift library by calling the method
   
   ```
   	[Helpshift installForAppID:@"<YOUR_APP_ID>"  domainName:@"<YOUR_COMPANY>.helpshift.com" apiKey:@"<YOUR_API_KEY>"];
   ```
   inside ***application:didFinishLaunchingWithOptions:*** method (ideally at the top) 
   for more information [refer doc](http://www.helpshift.com/docs/howto/ios/v2.x/#authentication)

3. Refer ***btnSupportClick:*** method in HSDViewController.m to show support screen & decomposed support screen, 
   for more information [refer doc](http://www.helpshift.com/docs/howto/ios/v2.x/#decomposition)


![Full Support screenshot](/Screenshot.png)